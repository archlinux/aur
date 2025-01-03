# Maintainer: Storm Dragon <storm_dragon@stormux.org>
pkgname=python-libloader
_pkgname=libloader
pkgver=0.21
pkgrel=1
pkgdesc="Quickly and easily load shared libraries from various platforms. Also includes a libloader.com module for loading com modules on Windows."
arch=('any')
url="https://pypi.org/project/libloader/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('75bef8eaaa4513272f9c1b1435089239866040f269f0d576914ec740018f519539b0bfa75f2807d6293c8518e4c1d69a5210cbe93a7be0d1b096b332e1e2cc1f')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
