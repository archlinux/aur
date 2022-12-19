# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>

pkgname=python-symspellpy
_pkgname=symspellpy
pkgver=6.7.7
pkgrel=2
pkgdesc="Python SymSpell"
arch=('any')
url="https://github.com/mammothb/symspellpy"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/mammothb/symspellpy/archive/v${pkgver}.tar.gz
)
sha256sums=('d8e0b2f9739fd25058b84d2c72a4255ab2e29633598aeb08b9292b618506effa')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
