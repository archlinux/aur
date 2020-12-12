# Maintainer epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgbase=purritobin
pkgname=purritobin
pkgver=0.3.3
pkgrel=1
pkgdesc="ultra fast, minimalistic, encrypted command line paste-bin"
url="https://bsd.ac/"
license=('ISC')
arch=('any')
source=( "${pkgname}-${pkgver}::https://github.com/PurritoBin/PurritoBin/archive/${pkgver}.tar.gz" )
md5sums=('23d266fb8a438d9c7bfe2d73e9f0cf36')
#depends=( usockets )

build() {
	cd PurritoBin-${pkgver}
	make all
}

package() {
	cd PurritoBin-${pkgver}
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}

#vim: syntax=sh
