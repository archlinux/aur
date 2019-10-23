# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=numix-circle-arc-icons-git
_pkgname=numix-circle-arc-icons
_destname="/usr/share/icons/"
_pkggithub="https://github.com/erikdubois/Numix-Circle-Arc"
pkgdesc="Install Numix and Numix Circle. Numix icons combined with the Arc folders"
pkgver=19.10
pkgrel=1
arch=('any')
url="${pkggithub}"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
depends=('numix-circle-icon-theme-git' 'numix-icon-theme-git')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip !emptydirs)
source=("${_pkgname}"::git+"${_pkggithub}")
sha256sums=('SKIP')
package() {
  rm -f "${srcdir}/${_pkgname}/"README.md
  rm -f "${srcdir}/${_pkgname}/"git-v*
  rm -f "${srcdir}/${_pkgname}/"setup*
  install -dm 755 "${pkgdir}"/"${_destname}"
  cp -dr --no-preserve='ownership' ${_pkgname}/* "${pkgdir}"/usr/share/icons/
}


