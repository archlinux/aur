pkgname=python-pygradientify
_name=pygradientify
pkgver=1.0.2
pkgrel=1
pkgdesc="Make terminal UI's beautiful"
arch=('any')
url="github.com/xsorroww/pygradientify"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}