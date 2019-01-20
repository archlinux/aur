# Maintainer: nl6720 <nl6720@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: d'Ronin <daronin@2600.com>

pkgname=judy
pkgver=1.0.5
pkgrel=5
arch=('x86_64')
pkgdesc='C library creating and accessing dynamic arrays'
depends=('glibc')
makedepends=('gcc')
license=('LGPL')
url='http://judy.sourceforge.net/'
source=("https://downloads.sourceforge.net/judy/Judy-${pkgver}.tar.gz")
sha1sums=('3540f003509acac3b1260424380ddf97914f7745')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make -j1
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
