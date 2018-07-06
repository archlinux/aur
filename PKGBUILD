# Maintainer: BasioMeusPuga <disgruntled.mob@gmail.com>

pkgname=lector
_pkgname=Lector
pkgdesc="Qt based ebook reader"
pkgver=0.4
pkgrel=1
arch=('any')
url="https://github.com/BasioMeusPuga/Lector"
license=('GPL3')
provides=('lector')
conflicts=('lector')
depends=('qt5-base' 'qt5-multimedia' 'python' 'python-pyqt5' 'python-beautifulsoup4' 'python-lxml' 'poppler-qt5' 'python-poppler-qt5')
makedepends=('git' 'python-setuptools')

source=("https://github.com/BasioMeusPuga/Lector/archive/0.4.tar.gz")
sha256sums=('c8deefc20fb3da98a327a893ce281e1efe5ee0c0a306d8cd19b44fd2e526649a')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
