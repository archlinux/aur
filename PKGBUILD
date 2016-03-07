# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nimsuggest
pkgver=0.1.0
pkgrel=1
pkgdesc="Tool for providing auto completion data for Nim source code"
arch=('i686' 'x86_64')
depends=('nim')
makedepends=('git' 'nimble')
url="https://github.com/nim-lang/nimsuggest"
license=('MIT')
source=($pkgname-$pkgver::git+https://github.com/nim-lang/nimsuggest)
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
  install -Dm 755 nimsuggest -t "$pkgdir/usr/bin"
}
