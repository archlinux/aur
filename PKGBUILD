_name='bip32'
_commit='1492d39312f1d9630363c292f6ab8beb8ceb16dd'
pkgname="python-$_name"
pkgver='3.4'
pkgrel=1
pkgdesc="A basic implementation of the bip-0032."
url="http://github.com/darosior/python-bip32"
depends=('python' 'python-base58' 'python-coincurve')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('BSD')
arch=('any')
source=(
    "git+https://github.com/darosior/$pkgname.git#commit=$_commit"
)
b2sums=(
    'SKIP'
)

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
