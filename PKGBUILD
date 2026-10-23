pkgname='python-inscriptis'
_name=${pkgname#python-}
pkgver=2.7.6
pkgrel=1
pkgdesc="HTML to text conversion library"
arch=('any')
url="https://github.com/weblyzard/inscriptis"
license=('Apache')
depends=(python-lxml python-requests)
makedepends=(python-build python-installer python-wheel python-poetry-core python-hatchling)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b8fe23c5ae4db33c9d1c5e1b7d000dbfa1decbea7b605ac87e0f5d8f8abc3ce6')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
