# Maintainer: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=repl-rs
_pkgname=repl-rs
pkgver=53.cde9620
pkgrel=1
pkgdesc="Rust Repl"
arch=('x86_64')
url="https://github.com/sigmaSd/repl-rs"
depends=('cargo' 'rust')
makedepends=('git')
provides=('repl-rs')
conflicts=('repl-rs')
license=('MIT')
source=("git+https://github.com/sigmaSd/$_pkgname.git")
sha256sums=('SKIP')

5() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  cargo build --release
}

package() {
  install -D -m755 "$srcdir/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  install -D -m644 "$srcdir/$_pkgname/"LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
