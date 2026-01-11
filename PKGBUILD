pkgname=stm
pkgver=1.0.0
pkgrel=1
pkgdesc="менеджер для проекта StoryTime-SMP"
arch=('x86_64')
url="https://github.com/Frog1-cell/StoryTimeSMP-Manger.git"
license=('MIT')
depends=()
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver::git+$url#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/stm "$pkgdir/usr/bin/stm"
}