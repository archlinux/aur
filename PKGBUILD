# Contributor: kusakata <shohei atmark kusakata period com>
# Contributor: Pablo Lezaeta <prflr88 (arro'a) gmail.com>
# Maintainer: jakka <jakkadoujin at gmail dot com>

pkgname=apngopt
pkgver=1.4
pkgrel=2
pkgdesc="Optimizes existing APNG animation"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/apng/files/APNG_Optimizer/"
license=("zlib")
depends=('libpng' 'gcc-libs')
makedepends=('cmake')
conflicts=('apng-utils')
source=("https://sourceforge.net/projects/apng/files/APNG_Optimizer/${pkgver}/apngopt-${pkgver}-src.zip")
sha512sums=('8dd97ca6fdd10b1285c3a850ab0f6e14113df0b4a607877a6fb7c5bacded02432504e3af87a43c4aa660bad7226f300af8e0967368ca1eef00c9df7f624d578c')

build() {
	cd "${srcdir}"
	make DESTDIR="${pkgdir}" prefix=/usr sbindir=/usr/bin bindir=/usr/bin libdir=/usr/lib
}

package() {
	cd "${srcdir}"
	install -Dm755 "${srcdir}/apngopt" "${pkgdir}/usr/bin/apngopt"
}
