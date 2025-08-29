# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Peter Flynn <peter@flynn.network>
pkgname=foundry-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="Blazing fast, portable and modular Ethereum development toolkit written in Rust"
arch=('aarch64' 'x86_64')
url="https://github.com/foundry-rs/foundry"
license=('Apache')
depends=('gcc-libs' 'openssl')
makedepends=('curl' 'bash')
makedepends_aarch64=('rust')
provides=('foundry' 'forge' 'cast' 'anvil' 'chisel')
conflicts=('foundry' 'foundry-git')

source_x86_64=("https://github.com/foundry-rs/foundry/releases/download/v${pkgver}/foundry_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/foundry-rs/foundry/releases/download/v${pkgver}/foundry_v${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('ae234391da3773188e9de13d2c7d4ffbc08582d5d826439405e4884a4153e50a')
sha256sums_x86_64=('944bb47fe15fd1ebf5f79376cc2b09dbe9c253ddd0090e2ff91588721410859a')

package() {
  cd "$srcdir"

  # Install binaries
  install -Dm755 forge   "$pkgdir/usr/bin/forge"
  install -Dm755 cast    "$pkgdir/usr/bin/cast"
  install -Dm755 anvil   "$pkgdir/usr/bin/anvil"
  install -Dm755 chisel  "$pkgdir/usr/bin/chisel"
}
