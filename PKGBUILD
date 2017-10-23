# Mantainer: Bruno Galeotti <bgaleotti@gmail.com>

pkgname=php-ast
pkgver=0.1.6
pkgrel=1
pkgdesc="Extension exposing PHP 7 abstract syntax tree."
url="https://github.com/nikic/php-ast"
license=("BSD")
arch=("any")
depends=("php>=7")
makedepends=("php>=7")
backup=("etc/php/conf.d/ast.ini")
source=("https://github.com/nikic/php-ast/archive/v${pkgver}.tar.gz" "ast.ini")
sha512sums=('f20629ff721dfa47b9ebdf802c28f46f7cbb54bebee9e1fba4f205d6c42445a92895b01e87071914e82b7bd9f03ce28275d4709d35e7ac9fd2b5bed3965dac0f'
            'a99dcb98e597dc2634f51ae9af80dce82350c0f0e45ec9c2eda23d53f40c06cfd2573fafe0660304b4ceb51f3d12a3f81445f3063ece1ca1166fb50a4d3967a8')

build() {
  cd $srcdir/$pkgname-$pkgver

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $srcdir/ast.ini $pkgdir/etc/php/conf.d/ast.ini
  install -Dm744 modules/ast.so $pkgdir/usr/lib/php/modules/ast.so
}

# vim:set ts=2 sw=2 et:
