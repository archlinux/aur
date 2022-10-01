# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pandas-stubs
_pkgname=${pkgname:7}
pkgver=1.5.0.220926
pkgrel=1
pkgdesc="Type annotations for Pandas"
arch=('any')
url="https://github.com/pandas-dev/pandas-stubs"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-poetry)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/pandas-stubs-$pkgver.tar.gz)
sha256sums=('e0f69466cbd8cf1da137b5899e69d9d150648dd5f0398db0e6aeaefe3b2c7a76')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
