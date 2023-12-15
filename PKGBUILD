# Maintainer: huggy <arch@huggy.moe>
# Contributor: Nick Cao <nickcao@nichi.co>

pkgname=ranet
pkgver=0.8.1
pkgrel=1
pkgdesc="ranet, acronym for redundant array of networks, forms full mesh IPSec VPN"
arch=('x86_64' 'aarch64')
url="https://github.com/NickCao/ranet"
license=('MIT')
makedepends=('cargo')

source=("https://github.com/NickCao/ranet/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('bdac310110b5c64370d7c28b999ca919461ec118b92b4997551f1803b5713f50ad489f9323fb62ab753656e48a90cd1b96bf45a49e1c405590b8561e392f3903')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "${pkgdir}/usr/bin/${pkgname}"
}
