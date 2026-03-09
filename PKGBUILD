# Maintainer: Rigami <team@rigami.xyz>
pkgname=rigami-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI for the Rigami quest platform"
arch=('x86_64')
url="https://rigami.xyz"
license=('MIT')
depends=()
makedepends=('cargo')
source=("https://github.com/rigamixyz/rigami-cli/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "rigami-cli-$pkgver"
  cargo build --release
}

package() {
  cd "rigami-cli-$pkgver"
  install -Dm755 "target/release/rigami" "$pkgdir/usr/bin/rigami"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
