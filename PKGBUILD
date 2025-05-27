# Maintainer: MostlyK <bruvistrue93@gmail.com>
pkgname=yappus
pkgver=1.1.1
pkgrel=2
pkgdesc="A terminal interface for your AI terminal assistant."
arch=('x86_64')
url="https://github.com/MostlyKIGuess/Yappus-Term"
license=('MIT')
depends=('gcc-libs' 'oniguruma')
makedepends=('rust' 'cargo')
source=("git+https://github.com/MostlyKIGuess/Yappus-Term.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/Yappus-Term"
  cargo build --release
}

package() {
  cd "$srcdir/Yappus-Term"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

}
