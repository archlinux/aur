# Maintainer: jxir <aur@jxir.de>
# Contributor: carlosal1015

pkgname=betterbib
pkgver=4.0.0
pkgrel=1
pkgdesc="Update BibTeX files with info from online resources"
arch=('any')
url="https://github.com/nschloe/betterbib"
license=('custom')
depends=('python>=3.8' 'python-appdirs' 'python-latexcodec' 'python-pybtex>=0.19.0'
         'python-pyenchant' 'python-requests' 'python-requests-cache' 'python-rich'
         'python-setuptools' 'python-unidecode' 'aspell-en' 'hspell' 'libvoikko'
         'nuspell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nschloe/betterbib/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('113fe46d1735fa1c34e6c422b17893f2285b3dc15b1d80fd47850f960754a116')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -c "from setuptools import setup; setup();" build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -c "from setuptools import setup; setup();" install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
