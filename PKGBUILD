# Maintainer: jxir <aur@jxir.de>

pkgname=betterbib
pkgver=3.5.3
pkgrel=1
pkgdesc="Update BibTeX files with info from online resources"
arch=('any')
url="https://github.com/nschloe/betterbib"
license=('custom')
depends=('python' 'python-pybtex' 'python-pyenchant' 'python-requests-cache' 'python-setuptools' 'python-tqdm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nschloe/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('635848d91a908c8b3379560dd67e90851d959a8ff69b25cd3fc2aab9611af0ce')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
