# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=cocot
pkgver=1.1_20120313
pkgrel=1
pkgdesc='COde COnverter on Tty'
arch=('i686' 'x86_64')
url="http://vmi.jp/software/cygwin/cocot.html"
license=('BSD')
depends=('glibc')
source=("https://github.com/vmi/cocot/archive/cocot-${pkgver//_/-}.tar.gz")

build() {
	cd "${srcdir}/cocot-cocot-${pkgver//_/-}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/cocot-cocot-${pkgver//_/-}"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

md5sums=('6b3fae7afb37a314c865c1e98821c189')
