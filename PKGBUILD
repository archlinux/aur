# shellcheck shell=bash
# Maintainer: Chinmay Dalal
pkgname=ttf-aporetic
_pkgmajor=1
_pkgminor=1
_pkgpatch=0
pkgver=${_pkgmajor}.${_pkgminor}.${_pkgpatch}
pkgrel=1
pkgdesc="Custom build of Iosevka with different style and metrics than the default."
arch=('any')
url="https://github.com/protesilaos/aporetic"
license=('OFL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/protesilaos/aporetic/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('9093a412d0ecc33211597b3dfab5335019fcb54ef327eaf2c43e78baf6ecd5c06d4a6fbcd9a23b30f2798c42cc8efbf116b7a5f3ec6992f0698f033b3cfbda1c')

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
