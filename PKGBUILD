pkgname='python-inscriptis'
_name=${pkgname#python-}
pkgver=2.7.5
pkgrel=1
pkgdesc="HTML to text conversion library"
arch=('any')
url="https://github.com/weblyzard/inscriptis"
license=('Apache')
depends=(python-lxml python-requests)
makedepends=(python-build python-installer python-wheel python-poetry-core python-hatchling)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3ce15f75ed7ae3ecf45c0c39458774011483c382686a61d04e49949104d44092')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
