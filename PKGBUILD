pkgname='python-inscriptis'
_name=${pkgname#python-}
pkgver=2.7.1
pkgrel=1
pkgdesc="HTML to text conversion library"
arch=('any')
url="https://github.com/weblyzard/inscriptis"
license=('Apache')
depends=(python-lxml python-requests)
makedepends=(python-build python-installer python-wheel python-poetry-core python-hatchling)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('16517bab88ac2c8f01d58748bf070256e8af7a3fac96d1e317b01371d04a3c6e')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
