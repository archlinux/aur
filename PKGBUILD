# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=sardi-orb-colora-mixing-icons-git
_pkgname=sardi-orb-colora-mixing-icons
_destname="/usr/share/icons/"
_pkggithub="https://github.com/erikdubois/Sardi-Orb-Colora-Mixing"
pkgdesc="Based on Sardi Orb Colora you can use the modularity to combine elements and create a new icon theme."
pkgver=20.3
pkgrel=6
arch=('any')
url="${pkggithub}"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
#depends=('sardi-icons')
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


