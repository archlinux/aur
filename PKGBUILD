# Maintainer: Jokler <jokler@protonmail.com>

pkgname=nora
pkgver=0.1.0
pkgrel=1
pkgdesc="Freezes the screen for another program"
arch=('i686' 'x86_64')
url="https://github.com/Jokler/nora"
license=('GPL3')
makedepends=('git' 'cargo' 'python')
depends=('libxcb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jokler/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e9a52252225dd79c61ac9d2edcb22a5f982bc61f6f069db668e071b2b995e7b4')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/nora" "$pkgdir/usr/bin/nora"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
# vim: expandtab sw=2 ts=2
