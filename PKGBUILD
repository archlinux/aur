# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pandas-stubs
_pkgname=pandas_stubs
pkgver=1.5.3.230321
pkgrel=1
pkgdesc="Type annotations for Pandas"
arch=('any')
url="https://github.com/pandas-dev/pandas-stubs"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-poetry)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/pandas_stubs-$pkgver.tar.gz)
sha256sums=('2fa860df9e6058e9f0d2c09bc711c09abb8f0516eee7f0b9f9950d29b835fc6f')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
