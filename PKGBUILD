# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Based on the gcc-docs PKGBUILD available in community
_pkgname=gfortran
pkgname=${_pkgname}-docs
pkgver=5.3.0
pkgrel=1
pkgdesc="Set of HTML documentation for then GNU Fortran compiler"
arch=('any')
url="https://gcc.gnu.org/onlinedocs/"
depends=('libgomp-docs')
license=('GPL')
options=('docs' '!strip')
source=(${pkgname}-html-${pkgver}.tar.gz::"https://gcc.gnu.org/onlinedocs/gcc-${pkgver}/${_pkgname}-html.tar.gz")
sha256sums=('b7ef9b423b0c5da1bfa5d5040d5fb15e82ebc9a110a6548cdb4fd888ea6872f3')

package() {
  cd "${srcdir}/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -- *.html "${pkgdir}/usr/share/doc/${_pkgname}/"
}
