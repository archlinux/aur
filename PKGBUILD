# Maintainer: jxir <aur@jxir.de>

pkgname=betterbib
pkgver=3.5.7
pkgrel=1
pkgdesc="Update BibTeX files with info from online resources"
arch=('any')
url="https://github.com/nschloe/betterbib"
license=('custom')
depends=('python' 'python-importlib-metadata' 'python-pybtex' 'python-pyenchant' 'python-requests-cache' 'python-setuptools' 'python-tqdm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nschloe/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e95a0dd909d0b05e82598657c090994958d4c435317f57d315e74afe92a6afe1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
