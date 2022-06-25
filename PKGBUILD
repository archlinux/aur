# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor : Caltlgin Stsodaat <contact@fossdaily.xyz>

# To avoid conflict with uconv from https://www.archlinux.org/packages/core/x86_64/icu/
# uconv will be installed with the name of uconv-c
_pkgname=uconv
pkgname=${_pkgname}-c

pkgver=0.0.3
pkgrel=1
pkgdesc='General unit converter for the command line'
arch=('x86_64')
url='https://github.com/kevinboone/uconv'
license=('GPL3')
provides=("${pkgname}")
install='readme.install'
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('93bcfe602c4ab6222708823088d8784b54ad6c0f646d31748b66696e6fa28a7a')

build() {
  make -C "${_pkgname}-${pkgver}"
}

package() {
  install -Dm755 "${_pkgname}-${pkgver}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}/man1/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${_pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
