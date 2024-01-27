# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
pkgname=python-wallbreaker
_name=Wallbreaker
pkgver=1.0.3
pkgrel=3
pkgdesc="A useful tool to live analyzing Java heap, powered by frida."
arch=('any')
url="https://github.com/hluwa/Wallbreaker"
license=('GPL-3.0-only')
depends=(
    'python'
    'python-frida'
    'python-click'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d0b2802e2d0a47b4249e72fd08213c580a7778d10b91d8651afd60b362b62641')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
