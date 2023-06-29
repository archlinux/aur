# Maintainer: Mumulhl <mumulhl@duck.com>
pkgname='python-giturlparse'
_module='giturlparse'
pkgver='0.10.0'
pkgrel=1
pkgdesc="A Git URL parsing module (supports parsing and rewriting)"
url="https://github.com/nephila/giturlparse"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('APACHE')
arch=('any')
source=("$_module-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c9413cbe83397214cba449b1274f1626b68682ab0a2eeba17a86d10e9a833dee')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
