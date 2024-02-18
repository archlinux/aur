# Maintainer: huggy <arch@huggy.moe>
# Contributor: Nick Cao <nickcao@nichi.co>

pkgname=ranet
pkgver=0.10.0
pkgrel=1
pkgdesc="ranet, acronym for redundant array of networks, forms full mesh IPSec VPN"
arch=('x86_64' 'aarch64')
url="https://github.com/NickCao/ranet"
license=('MIT')
makedepends=('cargo')

source=("https://github.com/NickCao/ranet/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('baacd93d240bbd12f1b3d99f312004e16eafddc7017ee22e1bbabd6caaa91fe059065e45ef6ec936ec67b1e8b3257ba902ccb887a9a475a2e1738df0d670e05d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "${pkgdir}/usr/bin/${pkgname}"
}
