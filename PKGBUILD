# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=python-rdbtools
_name=${pkgname#python-}
_fullname=redis-rdb-tools
pkgver=0.1.15
pkgrel=2
pkgdesc="Utilities to convert Redis RDB files to JSON or SQL formats"
arch=('any')
url="https://github.com/sripathikrishnan/redis-rdb-tools"
license=('MIT')
depends=('python' 'python-importlib-metadata' 'python-setuptools')
makedepends=()
optdepends=('python-lzf: highly recommended to speed up parsing')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_name-$pkgver.tar.gz")
sha256sums=('901c9846f74642e89b44d0fd932289fa62130d51fc6256ba4d8e208af8d23e27')

build() {
    cd "$_fullname-$_name-$pkgver"
    python setup.py build
}

# check() {
#     cd "$_fullname-$_name-$pkgver"
#     python run_tests
# }

package() {
    cd "$_fullname-$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
