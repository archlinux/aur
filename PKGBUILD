# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pandas-stubs
_pkgname=${pkgname:7}
pkgver=1.4.3.220718
pkgrel=1
pkgdesc="Type annotations for Pandas"
arch=('any')
url="https://github.com/pandas-dev/pandas-stubs"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-poetry)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/pandas-stubs-$pkgver.tar.gz)
sha256sums=('b1ce4d805c56b98c3453935bbedc46b96d169701137c4e03cff7d22731c6bad5')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
