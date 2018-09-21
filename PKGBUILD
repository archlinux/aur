# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-transparent-window-moving-git
pkgver=18.1891bce
pkgrel=1
pkgdesc="Makes the window semi-transparent when moving or resizing."
arch=('any')
url="https://github.com/Noobsai/transparent-window-moving"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=("${pkgname}::git+https://github.com/Noobsai/transparent-window-moving.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd ${pkgname}

  make EXTENSIONDIR="${pkgdir}/usr/share/gnome-shell/extensions/" install
}
