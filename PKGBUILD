# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=c2nim
pkgver=0.9.8
pkgrel=1
pkgdesc="Tool to translate Ansi C code to Nim"
arch=('i686' 'x86_64')
depends=('nim')
makedepends=('git' 'nimble')
url="https://github.com/nim-lang/c2nim"
license=('MIT')
source=($pkgname-$pkgver::git+https://github.com/nim-lang/c2nim)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  nimble build -y
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  install -Dm 755 c2nim -t "$pkgdir/usr/bin"
}
