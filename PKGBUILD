# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=python-rdbtools
_name=${pkgname#python-}
pkgver=0.1.15
pkgrel=1
pkgdesc="Utilities to convert Redis RDB files to JSON or SQL formats"
arch=('any')
url="https://github.com/sripathikrishnan/redis-rdb-tools"
license=('MIT')
depends=('python' 'python-importlib-metadata' 'python-setuptools')
makedepends=()
optdepends=('python-lzf: highly recommended to speed up parsing')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('689e57e42f43bdc73ea4e893d9676819980d17968696826b69fbd951f59772de')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

# check() {
#     cd "$_name-$pkgver"
#     python run_tests
# }

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
