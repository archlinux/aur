pkgname='python-inscriptis'
_name=${pkgname#python-}
pkgver=2.5.1
pkgrel=1
pkgdesc="HTML to text conversion library"
arch=('any')
url="https://github.com/weblyzard/inscriptis"
license=('Apache')
depends=(python-lxml python-requests)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a1d4d732301ee0859100ac0fd99ffdab44f9ed897a647d6255a05621beab3695')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
