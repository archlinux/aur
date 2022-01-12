# Original Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>
# Maintainer: Leopold Bloom <leopoldbloom@riseup.net>

pkgname=numix-square-icon-theme
pkgver=22.01.10
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
b2sums=('ceb74f9f82e62589f11a6658b9a469df5fd34549a67819a0c1d8e772b1472ace2499ccf647b53b3d7ffce8affbb8c4fd19288e7fc6d51dca11e5d8f2903a4279')
options=('!strip')

package() {
  _srcdir="${srcdir}/${_gitname}-${_pkgver}"
  _output="${pkgdir}/usr/share"
  install -dm755 "${_srcdir}/" "${_output}/icons/"
  cp -r  "${_srcdir}/Numix-Square" "${_output}/icons/"
  cp -r "${_srcdir}/Numix-Square-Light" "${_output}/icons/"
  install -Dm644 "${_srcdir}/LICENSE" "${_output}/licenses/${pkgname}/LICENSE"
}
