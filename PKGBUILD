pkgname=bazi-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="一个中国传统命理（八字）命盘分析的命令行程序"
arch=('x86_64')
url="https://github.com/Paul-sinbud2004/bazi-cli"
license=('MIT')
depends=()
makedepends=('rust' 'git')
source=("$pkgname::git+https://github.com/Paul-sinbud2004/Bazi-cli.git")
sha256sums=('SKIP')
export CARGO_TARGET_DIR="$srcdir/target"

build() {
  cd "$srcdir/$pkgname"
  CARGO_TARGET_DIR=target cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/bazi-cli" "$pkgdir/usr/bin/bazi-cli"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

