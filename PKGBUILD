# Original Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>
# Maintainer: Leopold Bloom <leopoldbloom@riseup.net>

pkgname=numix-square-icon-theme
pkgver=21.04.14
_pkgver=21.04.14
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
b2sums=('2663a65ee646068d6eca68e60119fc07793f951fbe1393ddd8caa20123ac82f07514e710a9c06732ae3960ad2c8a35c9b8cb6cb5056820effbccfd3cf904d66b')
options=('!strip')

package() {
  _srcdir="${srcdir}/${_gitname}-${_pkgver}"
  _output="${pkgdir}/usr/share"
  install -dm755 "${_srcdir}/" "${_output}/icons/"
  cp -r  "${_srcdir}/Numix-Square" "${_output}/icons/"
  cp -r "${_srcdir}/Numix-Square-Light" "${_output}/icons/"
  install -Dm644 "${_srcdir}/LICENSE" "${_output}/licenses/${pkgname}/LICENSE"
}
