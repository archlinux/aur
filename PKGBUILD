# Maintainer: jxir <aur@jxir.de>
# Contributor: carlosal1015

pkgname=betterbib
pkgver=3.5.16
pkgrel=1
pkgdesc="Update BibTeX files with info from online resources"
arch=('any')
url="https://github.com/nschloe/betterbib"
license=('custom')
depends=('python' 'python-importlib-metadata' 'python-pybtex' 'python-pyenchant'
         'python-requests-cache' 'python-setuptools' 'python-tqdm' 'python-pip'
         'python-itsdangerous' 'python-rich' 'aspell-en' 'nuspell' 'hspell'
         'libvoikko')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nschloe/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6e32bcb209a7e1f880aa5a3d66e33caa9a2c61407f856da817d7719e16a7acf5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -c "from setuptools import setup; setup();" build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -c "from setuptools import setup; setup();" install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
