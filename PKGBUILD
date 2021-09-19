# Original Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>
# Maintainer: Leopold Bloom <leopoldbloom@riseup.net>

pkgname=numix-square-icon-theme
pkgver=21.09.19
_pkgver=21.09.19
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
b2sums=('a8732071eb054e3390522dde307e58f85989c8d715d9cf7dd196af4a440b23fbced13c60d8b2cde51a161b5f3f0d7323baba203b5c5c2b7f86f730120e3b3344')
options=('!strip')

package() {
  _srcdir="${srcdir}/${_gitname}-${_pkgver}"
  _output="${pkgdir}/usr/share"
  install -dm755 "${_srcdir}/" "${_output}/icons/"
  cp -r  "${_srcdir}/Numix-Square" "${_output}/icons/"
  cp -r "${_srcdir}/Numix-Square-Light" "${_output}/icons/"
  install -Dm644 "${_srcdir}/LICENSE" "${_output}/licenses/${pkgname}/LICENSE"
}
