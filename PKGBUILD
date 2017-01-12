# Maintainer: Edgard Castro <castro@edgard.org>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=papirus-icon-theme-git
pkgver=r724.81a23d363
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}
