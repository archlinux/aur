# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Peter Flynn <peter@flynn.network>
pkgname=foundry-bin
pkgver=1.8.0
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
sha256sums_aarch64=('78a76b93bbb4d36a7e485b69a50a9c0550dbdc4d0c015ba4f21a578917bed12f')
sha256sums_x86_64=('8c8560de380d58d1ee145934427887b107182367600a3c33aa71f16f2ce7ac57')

package() {
  cd "$srcdir"

  # Install binaries
  install -Dm755 forge   "$pkgdir/usr/bin/forge"
  install -Dm755 cast    "$pkgdir/usr/bin/cast"
  install -Dm755 anvil   "$pkgdir/usr/bin/anvil"
  install -Dm755 chisel  "$pkgdir/usr/bin/chisel"
}
