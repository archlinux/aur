# Maintainer: Guillermo Quinteros <gu.quinteros@gmail.com>
pkgname=listen
pkgver=2.1.0
pkgrel=1
pkgdesc="Minimal audio transcription tool - 100% on-premise"
arch=('x86_64' 'aarch64')
url="https://github.com/gmoqa/listen"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('rust' 'cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gmoqa/listen/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6ad2e157e09be3b9cac4beffe120bcea12beb71b326d44384c4d07a4c5cfbff9')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/listen "$pkgdir/usr/bin/listen"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
