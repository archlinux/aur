# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=sardi-flexible-luv-colora-variations-icons-git
_pkgname=sardi-flexible-luv-colora-variations-icons
_destname="/usr/share/icons/"
_pkggithub="https://github.com/erikdubois/Sardi-Flexible-Luv-Colora-Variations"
pkgdesc="The Sardi icon set contains 80+ scripts to change from colour. Change it yourself with these scripts."
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


