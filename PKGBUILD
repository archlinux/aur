# Original Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>
# Maintainer: Leopold Bloom <leopoldbloom@riseup.net>

pkgname=numix-square-icon-theme
pkgver=21.10.31
_pkgver=21.10.31
_gitname=numix-icon-theme-square
pkgrel=1
pkgdesc="A square-ish shaped icon theme from the Numix Project"
arch=('any')
url='https://numixproject.org/'
license=('GPL3')
provides=("numix-square-icon-theme=${pkgver}")
depends=('numix-icon-theme-git' 'gtk-update-icon-cache')
conflicts=("numix-square-icon-theme-git")
source=("https://github.com/numixproject/${_gitname}/archive/${_pkgver}.tar.gz")
b2sums=('61022342a45d30f4b6d31bebf02916d9891eb6e9b30a6533d4dbf4bd5cf2ac3df28494b70a8707d5e8f22ab920e9431f81f1d8e31272fd8e3217a0799581c6c8')
options=('!strip')

package() {
  _srcdir="${srcdir}/${_gitname}-${_pkgver}"
  _output="${pkgdir}/usr/share"
  install -dm755 "${_srcdir}/" "${_output}/icons/"
  cp -r  "${_srcdir}/Numix-Square" "${_output}/icons/"
  cp -r "${_srcdir}/Numix-Square-Light" "${_output}/icons/"
  install -Dm644 "${_srcdir}/LICENSE" "${_output}/licenses/${pkgname}/LICENSE"
}
