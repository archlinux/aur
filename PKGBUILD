# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Peter Flynn <peter@flynn.network>
pkgname=foundry-bin
pkgver=1.8.3
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
sha256sums_aarch64=('93fc23be26c8a902ca58fe54aa6ca28c880b58af95d052674933161df7928e6d')
sha256sums_x86_64=('7ca48e6ca3cac1bce1403ca67e5bc1dc3bc1fd818199c9957c7165079c228568')

package() {
  cd "$srcdir"

  # Install binaries
  install -Dm755 forge   "$pkgdir/usr/bin/forge"
  install -Dm755 cast    "$pkgdir/usr/bin/cast"
  install -Dm755 anvil   "$pkgdir/usr/bin/anvil"
  install -Dm755 chisel  "$pkgdir/usr/bin/chisel"
}
