# Maintainer JohnGavr <gavriilidisg@tutanota.com>

pkgname=artix-dark-theme-git
_realname=artix-dark-theme
pkgver=20200130.r9.711a66d
pkgrel=1
pkgdesc="Dark Artix theme - GTK2/3, QT5, Plasma splash "
arch=('any')
url="https://gitea.artixlinux.org/nous/artix-dark-theme"
license=('GPL')
source=('git+https://gitea.artixlinux.org/nous/artix-dark-theme.git')
sha256sums=('SKIP')
makedepends=('git')
optdepends=('gtk2' 'gtk3' 'qt5' 'plasma' 'gtk-engines' 'xcursor-premium' 'qt5ct' 'openbox' 'gtk-engine-murrine')

pkgver() {
  cd "${_realname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_realname}"
  mkdir -p "${pkgdir}"/usr/share/themes
  cp -rf usr "${pkgdir}"/
}
