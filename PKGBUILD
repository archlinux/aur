# Original Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>
# Maintainer: Leopold Bloom <leopoldbloom@riseup.net>

pkgname=numix-square-icon-theme
pkgver=22.04.06
_pkgver=${pkgver}
_gitname=numix-icon-theme-square
pkgrel=1
pkgdesc="A square-ish shaped icon theme from the Numix Project"
arch=('any')
url='https://github.com/numixproject/numix-icon-theme-square/'
license=('GPL3')
provides=("numix-square-icon-theme=${pkgver}")
depends=('numix-icon-theme-git' 'gtk-update-icon-cache')
conflicts=("numix-square-icon-theme-git")
source=("https://github.com/numixproject/${_gitname}/archive/${_pkgver}.tar.gz")
b2sums=('9866e0f5a86b49e5dcd359f809d260f895f74c485424dbec39ab46f259dcc3c7857169a7a367ee033a306c72b07903e19274ef2e5551996386f1c86408cdf159')
options=('!strip')

package() {
  _srcdir="${srcdir}/${_gitname}-${_pkgver}"
  _output="${pkgdir}/usr/share"
  install -dm755 "${_srcdir}/" "${_output}/icons/"
  cp -r  "${_srcdir}/Numix-Square" "${_output}/icons/"
  cp -r "${_srcdir}/Numix-Square-Light" "${_output}/icons/"
  install -Dm644 "${_srcdir}/LICENSE" "${_output}/licenses/${pkgname}/LICENSE"
}
