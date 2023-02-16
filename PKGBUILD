# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pandas-stubs
_pkgname=pandas_stubs
pkgver=1.5.3.230214
pkgrel=1
pkgdesc="Type annotations for Pandas"
arch=('any')
url="https://github.com/pandas-dev/pandas-stubs"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-poetry)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/pandas_stubs-$pkgver.tar.gz)
sha256sums=('5fc1fc9c470d5332f9025a53ecab4c36cb80b2c52a596d597d6c5e33b4078153')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
