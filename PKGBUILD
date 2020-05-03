# Mantainer: Bruno Galeotti <bgaleotti@gmail.com>

pkgname=php-ast
pkgver=1.0.5
pkgrel=1
pkgdesc="Extension exposing PHP 7 abstract syntax tree."
url="https://github.com/nikic/php-ast"
license=("BSD")
arch=("any")
depends=("php>=7")
makedepends=("php>=7")
backup=("etc/php/conf.d/ast.ini")
source=("https://github.com/nikic/php-ast/archive/v${pkgver}.tar.gz" "ast.ini")
sha512sums=('42803b954bdbad7e788b8da955104b1d21266cc4936463f524bb3a3ad59b594f30cb24d54dca9d9f69e2f3a7a23307ad6dfdbc2a431ff7e651ec514b8f60159c'
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
