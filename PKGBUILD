# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=tzsp2pcap-git
pkgver=r16.e2e5d91
pkgrel=1
pkgdesc="Simple live TaZmen Sniffer Protocol (TZSP) to pcap converter"
arch=('i686' 'x86_64')
url="https://github.com/thefloweringash/tzsp2pcap"
license=('BSD')
groups=('network')
depends=('libpcap')
makedepends=('git')
source=("$pkgname::git+https://github.com/thefloweringash/tzsp2pcap.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  LDFLAGS="-D_DEFAULT_SOURCE" make
}

package() {
  cd $pkgname
  install -Dm755 tzsp2pcap "$pkgdir/usr/bin/tzsp2pcap"
}

# vim:set ts=2 sw=2 et:
