# shellcheck shell=bash
# Maintainer: Chinmay Dalal
pkgname=ttf-aporetic
_pkgmajor=1
_pkgminor=2
_pkgpatch=0
pkgver=${_pkgmajor}.${_pkgminor}.${_pkgpatch}
pkgrel=1
pkgdesc="Custom build of Iosevka with different style and metrics than the default."
arch=('any')
url="https://github.com/protesilaos/aporetic"
license=('OFL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/protesilaos/aporetic/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('5241eeba8920db6bb71443f60dfbd6fa2cbe8687479018f28ce72530ae3122f587cefd173208830c5e95927fe0eca916e482f42acc11974958f2a7f49e41e4bb')

package() {
  # Create font directory
  install -d "${pkgdir}/usr/share/fonts/TTF/"

  # Install all TTF variants
  install -m644 "${srcdir}"/aporetic-"${pkgver}"/aporetic-sans-mono/TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -m644 "${srcdir}"/aporetic-"${pkgver}"/aporetic-sans/TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -m644 "${srcdir}"/aporetic-"${pkgver}"/aporetic-serif-mono/TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -m644 "${srcdir}"/aporetic-"${pkgver}"/aporetic-serif/TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF"

  # Install license
  install -D -m644 "${srcdir}"/aporetic-"${pkgver}"/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
