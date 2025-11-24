# Maintainer: Kinan Maarrawi kinan@maarrawi.com

pkgname=terra-tui
pkgver=1.0.0
pkgrel=1
pkgdesc="A procedural terrain explorer TUI written in Haskell"
arch=('x86_64')
url="https://github.com/KinanMaarrawi/terra-tui"
license=('MIT')
depends=('ghc' 'haskell-optparse-applicative' 'haskell-brick' 'haskell-vty')
makedepends=('stack' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/KinanMaarrawi/terra-tui/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  stack build --copy-bins --local-bin-path "$srcdir/bin"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$srcdir/bin/terra-tui" "$pkgdir/usr/bin/terra-tui"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

