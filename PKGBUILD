# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=lchat
pkgver=1.0
pkgrel=1
pkgdesc="line chat is a line oriented front end for ii-like chat programs."
arch=('any')
url="https://tools.suckless.org/lchat/"
license=('ISC')
makedepends=('libgrapheme')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("${pkgname}-${pkgver}.tar.gz::https://dl.suckless.org/tools/lchat-${pkgver}.tar.gz")
sha256sums=('89247b5c8e853bbfc2f97909b1926fadf44d637543767e77e9e42e72242f375f')

build() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
  make
}

package() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
}
