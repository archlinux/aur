# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

# To avoid conflict with uconv from https://www.archlinux.org/packages/core/x86_64/icu/
# uconv will be installed with the name of uconv-c
_pkgname=uconv
pkgname=${_pkgname}-c

pkgver=0.0.1
pkgrel=1
pkgdesc='General unit converter for the command line'
arch=('x86_64' 'i686')
url='https://github.com/kevinboone/uconv'
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
install='info.install'
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('7a3e421a156aebae8bfb0b21e256059fbcff4a2085ed2dd4e75eb38455c9f2b7')

build() {
  make -C "${_pkgname}-${pkgver}"
}

package() {
  install -Dm755 "${_pkgname}-${pkgver}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}/man1/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 "${_pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
