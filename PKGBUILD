# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Peter Flynn <peter@flynn.network>
pkgname=foundry-bin
pkgver=1.10.1
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
sha256sums_aarch64=('a040ac0f6ec0953ede57a7a130d46b43f185a5167feb69856e37ef03710b230d')
sha256sums_x86_64=('577ba5548f74748c7e75bd324a98084b8812b1a34001b5c9527c832975ad06bc')

package() {
  cd "$srcdir"

  # Install binaries
  install -Dm755 forge   "$pkgdir/usr/bin/forge"
  install -Dm755 cast    "$pkgdir/usr/bin/cast"
  install -Dm755 anvil   "$pkgdir/usr/bin/anvil"
  install -Dm755 chisel  "$pkgdir/usr/bin/chisel"
}
