# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgbase='tela-circle-icon-theme-spl-git'
pkgname=('tela-circle-icon-theme-all-git'
         'tela-circle-icon-theme-standard-git'
         'tela-circle-icon-theme-black-git'
         'tela-circle-icon-theme-blue-git'
         'tela-circle-icon-theme-brown-git'
         'tela-circle-icon-theme-green-git'
         'tela-circle-icon-theme-grey-git'
         'tela-circle-icon-theme-orange-git'
         'tela-circle-icon-theme-pink-git'
         'tela-circle-icon-theme-purple-git'
         'tela-circle-icon-theme-red-git'
         'tela-circle-icon-theme-yellow-git'
         'tela-circle-icon-theme-manjaro-git'
         'tela-circle-icon-theme-ubuntu-git'
         'tela-circle-icon-theme-dracula-git'
         'tela-circle-icon-theme-nord-git')
pkgver=2022.11.06.r26.g1aac9cf5
pkgrel=1
pkgdesc="A flat colorful design icon theme"
arch=('any')
url='https://github.com/vinceliuice/Tela-circle-icon-theme'
license=('GPL3')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
makedepends=('bash' 'git')
provides=('tela-circle-icon-theme' 'tela-circle-icon-theme-git')
options=('!strip')
source=("${pkgbase%-git}::git+https://github.com/vinceliuice/Tela-circle-icon-theme.git")
b2sums=('SKIP')

pkgver() {
  cd "${pkgbase%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

_package() {
  pkgdesc="${pkgdesc} (${1} variant)"
  conflicts=("${pkgbase%-git}-all-git" "${pkgbase%-git}-all" "${pkgbase%-git}-${1}")
  cd "${pkgbase%-git}"
  install -dm755 "${pkgdir}/usr/share/icons"
  ./install.sh -d "${pkgdir}/usr/share/icons" ${1}
}

package_tela-circle-icon-theme-all-git() {
  pkgdesc="${pkgdesc} (all variants)"
  conflicts=(${pkgname[@]/${pkgbase%-git}-all-git})
  for _p in ${pkgname[@]}; do conflicts+=(${_p%-git}); done
  cd "${pkgbase%-git}"
  install -dm755 "${pkgdir}/usr/share/icons"
  ./install.sh -a -d "${pkgdir}/usr/share/icons"
}

package_tela-circle-icon-theme-standard-git() {
  _package standard
}

package_tela-circle-icon-theme-black-git() {
  _package black
}

package_tela-circle-icon-theme-blue-git() {
  _package blue
}

package_tela-circle-icon-theme-brown-git() {
  _package brown
}

package_tela-circle-icon-theme-green-git() {
  _package green
}

package_tela-circle-icon-theme-grey-git() {
  _package grey
}

package_tela-circle-icon-theme-orange-git() {
  _package orange
}

package_tela-circle-icon-theme-pink-git() {
  _package pink
}

package_tela-circle-icon-theme-purple-git() {
  _package purple
}

package_tela-circle-icon-theme-red-git() {
  _package red
}

package_tela-circle-icon-theme-yellow-git() {
  _package yellow
}

package_tela-circle-icon-theme-manjaro-git() {
  _package manjaro
}

package_tela-circle-icon-theme-ubuntu-git() {
  _package ubuntu
}

package_tela-circle-icon-theme-dracula-git() {
  _package dracula
}

package_tela-circle-icon-theme-nord-git() {
  _package nord
}
