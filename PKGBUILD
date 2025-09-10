# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=python-toml-sort
_name=${pkgname#python-}
pkgver=0.24.3
pkgrel=1
pkgdesc="Toml sorting library"
arch=('any')
url="https://github.com/pappasam/toml-sort"
license=('MIT')
depends=('python' 'python-tomlkit' 'python-importlib-metadata')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5a33ce66b1e666d850b0bf4acd065b97480001d20ac0c63f0e40d30071656a87')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
