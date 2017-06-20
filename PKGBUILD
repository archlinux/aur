# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Based on the gcc-docs PKGBUILD available in community
_pkgname=gfortran
pkgname=${_pkgname}-docs
pkgver=7.1.0
pkgrel=1
pkgdesc="Set of HTML documentation for then GNU Fortran compiler"
arch=('any')
url="https://gcc.gnu.org/onlinedocs/"
depends=('libgomp-docs')
license=('GPL')
options=('docs' '!strip')
source=(${pkgname}-html-${pkgver}.tar.gz::"https://gcc.gnu.org/onlinedocs/gcc-${pkgver}/${_pkgname}-html.tar.gz")
sha256sums=('b9bfd64b81cdf97fbe46a42c42ee0fdcc95a58ad48f575ea5d5bbd52291ec6c3')

package() {
  cd "${srcdir}/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -- *.html "${pkgdir}/usr/share/doc/${_pkgname}/"
}
