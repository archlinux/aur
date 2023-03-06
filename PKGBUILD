# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pymap3d
_pkgname=${pkgname:7}
pkgver=3.0.1
pkgrel=1
pkgdesc="Python coordinate conversions, following convention of several popular Matlab routines"
arch=(any)
url="https://github.com/geospace-code/pymap3d"
license=('BSD-2-Clause License')
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('09a80a8ca7abd3f089c4d5a7d7a5827bec023160efd4356d809b02550508b4c5')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
