# Maintainer: Paul Fauchon <p.fauchon at gmail dot com>
pkgname=unifi-throughput-ncurses
pkgver=r57.b7c113f
pkgrel=1
pkgdesc="Display unifi controller throughput in a terminal"
arch=('x86_64')
url="https://github.com/lamarios/unifi-throughput-ncurses/"
license=('MIT')
depends=('ncurses')
makedepends=('git' 'go')

source=("git://github.com/lamarios/unifi-throughput-ncurses/")

sha512sums=('SKIP')

pkgver() {
  cd unifi-throughput-ncurses
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd unifi-throughput-ncurses
  make
  mkdir -p $pkgdir/usr/bin
  cp unifi-throughput $pkgdir/usr/bin/unifi-throughput
}

