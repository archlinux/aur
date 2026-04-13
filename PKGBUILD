# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Karmanyaah Malhotra <karmanyaahm@gmail.com>

pkgname=gotify-dunst-git
pkgver=r32.d79a3d8
pkgrel=2
pkgdesc='A simple script for receiving Gotify message notifications via dunst'
arch=('any')
url='https://github.com/ztpnk/gotify-dunst'
license=('GPL-3.0-only')
depends=('python3' 'python-setproctitle' 'python-websocket-client' 'libnotify')
makedepends=('git')
source=("$pkgname::git+https://github.com/ztpnk/gotify-dunst")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
