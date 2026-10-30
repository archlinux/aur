# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Peter Flynn <peter@flynn.network>
pkgname=foundry-bin
pkgver=1.8.7
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
sha256sums_aarch64=('6f0e5697801cbdd059553360b2cb54ff52870789a0249a16da2a07c157a18534')
sha256sums_x86_64=('ba470eb718e779e4b0e3f1520b5284231b1bf98e9a39de07fb8f77ed70525bcf')

package() {
  cd "$srcdir"

  # Install binaries
  install -Dm755 forge   "$pkgdir/usr/bin/forge"
  install -Dm755 cast    "$pkgdir/usr/bin/cast"
  install -Dm755 anvil   "$pkgdir/usr/bin/anvil"
  install -Dm755 chisel  "$pkgdir/usr/bin/chisel"
}
