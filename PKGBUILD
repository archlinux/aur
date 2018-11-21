# Maintainer Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=gnome-shell-extension-ds4battery-git
pkgver=2ecf34d
pkgrel=1
pkgdesc="Gnome Shell extensions battery indicator for Sony DS4 Controller"
arch=('any')
url="https://bitbucket.org/thankjura/ds4battery"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
source=("$pkgname::git+https://bitbucket.org/thankjura/ds4battery.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git rev-parse --short HEAD
}

package() {
  cd "$pkgname"

  mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions

  cp -r .  "${pkgdir}/usr/share/gnome-shell/extensions/$pkgname"

  chown -R 644 ${pkgdir}/usr/share/gnome-shell/extensions/$pkgname
}


