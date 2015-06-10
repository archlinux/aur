#Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
#Maintainer: Francois Boulogne <fboulogne at april.org>

pkgname=safe-rm
pkgver=0.12
pkgrel=1
pkgdesc="A tool intended to prevent the accidental deletion of important files."
arch=("any")
url="https://launchpad.net/safe-rm"
license=("GPL3")
depends=("perl" "coreutils")
options=(!emptydirs)
source=(https://launchpad.net/safe-rm/trunk/${pkgver}/+download/safe-rm-${pkgver}.tar.gz)


build(){
	cd "${srcdir}"/${pkgname}-${pkgver}
    pod2man ${pkgname} >  ${pkgname}.1
}

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}
	install -D ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
    install -D ${pkgname}.1 "${pkgdir}"/usr/share/man/man1/${pkgname}.1
}

md5sums=('dd8cba1c03f8bc1c25453dfc07555d0d')
