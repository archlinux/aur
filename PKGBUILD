# Maintainer: jxir <aur@jxir.de>
# Contributor: carlosal1015

pkgname=betterbib
pkgver=4.0.1
pkgrel=1
pkgdesc="Update BibTeX files with info from online resources"
arch=('any')
url="https://github.com/nschloe/betterbib"
license=('custom')
depends=('python>=3.8' 'python-appdirs' 'python-latexcodec' 'python-pybtex>=0.19.0'
         'python-pyenchant' 'python-requests' 'python-requests-cache' 'python-rich'
         'python-setuptools' 'python-unidecode' 'aspell-en' 'hspell' 'libvoikko'
         'nuspell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nschloe/betterbib/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('508b1a07144bb2c2e3b948906dcfd18e4afe2edc4df3bd94b2c8cca3b666d397')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -c "from setuptools import setup; setup();" build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -c "from setuptools import setup; setup();" install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
