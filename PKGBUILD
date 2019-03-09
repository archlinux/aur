# Maintainer: BasioMeusPuga <disgruntled.mob@gmail.com>

pkgname=lector
_pkgname=Lector
pkgdesc="Qt based ebook reader with support for PDF, epub, fb2, comicbooks, mobi, azw"
pkgver=0.5.1
pkgrel=1
arch=('any')
url="https://github.com/BasioMeusPuga/Lector"
license=('GPL3')
provides=('lector')
conflicts=('lector')
depends=('qt5-base' 'qt5-multimedia' 'python' 'python-pyqt5' 'python-beautifulsoup4' 'python-lxml' 'python-pymupdf' 'python-xmltodict')
makedepends=('git' 'python-setuptools')

source=("https://github.com/BasioMeusPuga/Lector/archive/0.5.1.tar.gz")
sha256sums=('f35dc56a870f02b3eeb95d697ecd1e4784a7696f831fdfd8eb5dc935da622be6')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
