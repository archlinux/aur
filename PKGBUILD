# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=python-toml-sort
_name=${pkgname#python-}
pkgver=0.26.0
pkgrel=1
pkgdesc="Toml sorting library"
arch=('any')
url="https://github.com/pappasam/toml-sort"
license=('MIT')
depends=('python' 'python-tomlkit' 'python-importlib-metadata')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e45fc02a101b3117efd546ac4953375a8789b7a68840b8ca9dd74289d24e3ec7')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
