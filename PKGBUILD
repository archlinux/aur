pkgname='python-inscriptis'
_name=${pkgname#python-}
pkgver=2.7.0
pkgrel=1
pkgdesc="HTML to text conversion library"
arch=('any')
url="https://github.com/weblyzard/inscriptis"
license=('Apache')
depends=(python-lxml python-requests)
makedepends=(python-build python-installer python-wheel python-poetry-core python-hatchling)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('52ee95e63611ba46481f0be5cf56988d4a1b9672e382c9b1cea2e0ff90bb29f3')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
