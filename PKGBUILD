# Maintainer: Allan M. de Azevedo <4lln.medeiros at gmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Edgard Castro <castro@edgard.org>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=papirus-icon-theme-git
pkgver=20200102.r62.gb7fc53b171
pkgrel=1
epoch=1
pkgdesc="Papirus icon theme (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('any')
license=('LGPL3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=(
  "${pkgname%-git}"
  "papirus-gtk-icon-theme"
  "papirus-gtk-icon-theme-git"
  "papirus-icon-theme-gtk"
  "papirus-icon-theme-gtk-git"
  "papirus-icon-theme-kde"
  "papirus-icon-theme-kde-git"
)
replaces=(
  "papirus-icon-theme-gtk-git"
  "papirus-icon-theme-kde-git"
)
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}
# vim:set ts=2 sw=2 et:
