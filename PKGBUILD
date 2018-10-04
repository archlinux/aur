# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-system76-power-git
pkgver=47.0cc2661
pkgrel=1
pkgdesc="Gnome shell extension for System76 power management"
arch=('any')
url="https://github.com/pop-os/gnome-shell-extension-system76-power"
license=('MIT')
#depends=('gnome-shell' 'system76-power')
depends=('gnome-shell')
makedepends=('git' 'make')
source=("${pkgname}::git+https://github.com/pop-os/gnome-shell-extension-system76-power.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd ${pkgname}

  make DESTDIR="${pkgdir}" install
}
