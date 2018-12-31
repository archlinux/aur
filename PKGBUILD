# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: David Vogt <dave at winged dot ch>

pkgname=rst2ctags
pkgver=0.2.2
pkgrel=1
pkgdesc='Generates ctags-compatible output for the sections of a reStructuredText document'
arch=('any')
url=https://github.com/jszakmeister/rst2ctags
license=('BSD')
depends=('python-setuptools')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('feba8122592b962692b9cce321375b5807ba4e283404ae0876d2c4e429bef4b88753c7f55f8b483a05536347abefde8d6a6f6e93ef9999e920f02a5ae43d5b50')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
