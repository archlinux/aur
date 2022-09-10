# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pandas-stubs
_pkgname=${pkgname:7}
pkgver=1.4.4.220906
pkgrel=1
pkgdesc="Type annotations for Pandas"
arch=('any')
url="https://github.com/pandas-dev/pandas-stubs"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-poetry)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/pandas-stubs-$pkgver.tar.gz)
sha256sums=('05b6709b8edf721858ebc7523ff5e8c7b4dcb9774bf91b0e03abb64a6b4e330b')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
