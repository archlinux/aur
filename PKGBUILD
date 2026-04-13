# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Karmanyaah Malhotra <karmanyaahm@gmail.com>

_pkgname=gotify-dunst
pkgname=${_pkgname}-git
pkgver=r32.d79a3d8
pkgrel=3
pkgdesc='A simple script for receiving Gotify message notifications via dunst'
arch=('any')
url='https://github.com/ztpnk/gotify-dunst'
license=('GPL-3.0-only')
depends=('python3' 'python-setproctitle' 'python-websocket-client' 'libnotify')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
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
