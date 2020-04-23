# Maintainer: ryanw
# Contributor: Adolfo silerio
# Contributor: Francisco Javier Ospina <francisco.ospina@gmail.com>

pkgname=oranchelo-icon-theme-git
_gitname=oranchelo-icon-theme
pkgver=0.8.r6.g13886cb
pkgrel=2
pkgdesc='Oranchelo is a flat-design icon theme for XFCE4 based on Super Flat Remix and inspired by "Corny icons" by Patryk Goworowski. (git version)'
arch=(any)
makedepends=('git')
url='https://github.com/OrancheloTeam/oranchelo-icon-theme'
license=('GPL3')
groups=('gnome' 'xfce')
conflicts=('oranchelo-icon-theme')
provides=('oranchelo-icon-theme')
source=("${_gitname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d -m 755 "${pkgdir}/usr/share/icons/Oranchelo"
  install -d -m 755 "${pkgdir}/usr/share/icons/Oranchelo-Green"
  install -d -m 755 "${pkgdir}/usr/share/icons/Oranchelo-Beka"
  install -d -m 755 "${pkgdir}/usr/share/icons/Oranchelo-Classic-Folders"
  install -d -m 755 "${pkgdir}/usr/share/icons/oranchelo-light"

  cd "${srcdir}/${_gitname}/Oranchelo"
  cp -r . "${pkgdir}/usr/share/icons/Oranchelo/"
  cd "${srcdir}/${_gitname}/Oranchelo-Green"
  cp -r . "${pkgdir}/usr/share/icons/Oranchelo-Green/"
  cd "${srcdir}/${_gitname}/Oranchelo-Beka"
  cp -r . "${pkgdir}/usr/share/icons/Oranchelo-Beka/"
  cd "${srcdir}/${_gitname}/Oranchelo-Classic-Folders"
  cp -r . "${pkgdir}/usr/share/icons/Oranchelo-Classic-Folders/"
  cd "${srcdir}/${_gitname}/oranchelo-light"
  cp -r . "${pkgdir}/usr/share/icons/Oranchelo-Light/"
}
