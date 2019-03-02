# Maintainer: BasioMeusPuga <disgruntled.mob@gmail.com>

pkgname=lector
_pkgname=Lector
pkgdesc="Qt based ebook reader"
pkgver=0.5
pkgrel=1
arch=('any')
url="https://github.com/BasioMeusPuga/Lector"
license=('GPL3')
provides=('lector')
conflicts=('lector')
depends=('qt5-base' 'qt5-multimedia' 'python' 'python-pyqt5' 'python-beautifulsoup4' 'python-lxml' 'python-pymupdf' 'python-xmltodict')
makedepends=('git' 'python-setuptools')

source=("https://github.com/BasioMeusPuga/Lector/archive/0.5.tar.gz")
sha256sums=('cb10aea74bddfe81942c91566d719176347df5c3ca463f0cacd7569dd1f67358')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
