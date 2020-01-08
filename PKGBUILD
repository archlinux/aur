# Maintainer: jxir <aur@jxir.de>

pkgname=betterbib
pkgver=3.5.2
pkgrel=1
pkgdesc="Update BibTeX files with info from online resources"
arch=('any')
url="https://github.com/nschloe/betterbib"
license=('custom')
depends=('python' 'python-pybtex' 'python-pyenchant' 'python-requests-cache' 'python-setuptools' 'python-tqdm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nschloe/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('3e68d5a0f785be86539c8b2996ca93dea3c08fb465c3f9457b02ef1413e1aa84')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
