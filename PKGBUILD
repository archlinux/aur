# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: David Vogt <dave at winged dot ch>

pkgname=rst2ctags
pkgver=0.2.6
pkgrel=1
pkgdesc='Generates ctags-compatible output for the sections of a reStructuredText document'
arch=('any')
url=https://github.com/jszakmeister/rst2ctags
license=('BSD')
depends=('python-setuptools')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('fcd925746127152d185f3ab61c16ac4bafa9312da122a3a89ec62a7cf44e568003c151b2990e98bfa1bd34586e3ad3a968425c47d664b0489adec31dc7449c8f')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
