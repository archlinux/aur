# Maintainer: graygraygray
pkgname=shackle-git
pkgver=r0.0.0
pkgrel=0
pkgdesc="a hyprland rice but not yet"
arch=('any')
url="https://codeberg.org/graygraygray/shackle"
license=('GPL3')
depends=('quickshell' 'qt6-wayland')
makedepends=('git')
provides=('shackle')
conflicts=('shackle')
source=("git+https://codeberg.org/graygraygray/shackle.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  # For now, we just install the README to show the name is taken... ee~
  install -Dm644 README.md "$pkgdir/usr/share/doc/shackle/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/shackle/LICENSE"
}
