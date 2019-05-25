# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=kytan-git
pkgver=0903be12
pkgrel=1
pkgdesc='High Performance Peer-to-Peer VPN by rust'
arch=('x86_64')
url='https://github.com/changlan/kytan'
license=('MIT')
makedepends=('rust')
depends=()
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/kytan "$pkgdir/usr/bin/kytan"
}
