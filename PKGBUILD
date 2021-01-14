# Maintainer epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgbase=purritobin
pkgname=purritobin
pkgver=0.4.0
pkgrel=1
pkgdesc="ultra fast, minimalistic, encrypted command line paste-bin"
url="https://bsd.ac/"
license=('ISC')
arch=('any')
source=( "${pkgname}-${pkgver}::https://github.com/PurritoBin/PurritoBin/archive/${pkgver}.tar.gz" )
md5sums=('7b625284040bea10dd4780cbb94f4f68')
depends=( usockets )
makedepends=( uwebsockets )

build() {
	cd PurritoBin-${pkgver}
	make all
}

package() {
	cd PurritoBin-${pkgver}
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}

#vim: syntax=sh
