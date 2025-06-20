# Maintainer: mbutsk mbutsk@icloud.com
# Contributer: n0n1m

_name=aiomax
pkgname=python-$_name
pkgver=2.5.1
pkgrel=1
pkgdesc="Asynchronous framework for Max Bot API"
arch=('any')
url="https://github.com/dpnspn/aiomax"
license=('MIT')
depends=(python3 python-aiohttp)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('0006d5785000078aca34799188eac620c52e20acdec1ffc3f5391c42fda49ee7')
conflicts=(python-aiomax-git)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}