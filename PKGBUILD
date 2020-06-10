# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=subsystemctl
pkgver=0.0.1
pkgrel=1
pkgdesc="Run systemd in WSL2"
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/subsystemctl"
license=('MIT')
makedepends=('cargo')
source=(
  "https://github.com/sorah/subsystemctl/archive/v${pkgver}.tar.gz"
)

build() {
  cd "subsystemctl-$pkgver"
  cargo build --release --locked --all-features
}

package() {
  cd "subsystemctl-$pkgver"
  install -Dm6755 target/release/subsystemctl "${pkgdir}/usr/bin/subsystemctl"
}
sha512sums=('58e24e668d13c80ae3152734305cd2aed1b921f18a5afc48d38ffef2337ddaedc5a821099a46b93479791e032a0eb54505731ec53e783a64439c66ddceffa6db')
