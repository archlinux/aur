# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: David Vogt <dave at winged dot ch>

pkgname=rst2ctags
pkgver=0.2.3
pkgrel=1
pkgdesc='Generates ctags-compatible output for the sections of a reStructuredText document'
arch=('any')
url=https://github.com/jszakmeister/rst2ctags
license=('BSD')
depends=('python-setuptools')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9fe494f5967d36a6223ecd2c85152c5f19a21f0b6b0b854011ff1b057522497e4ed983a5131f5b2588fe7877dafc3612a45cd04193c393ed24ca0168496b18c6')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
