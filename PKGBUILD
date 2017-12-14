# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=cocot
pkgver=1.2_20171118
pkgrel=1
pkgdesc='COde COnverter on Tty'
arch=('x86_64')
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

md5sums=('4ea721411579f16c11c347162216fcb0')
