#Maintainer: anonion <aur at anonion dot social>

pkgname=("python-uptime-kuma-api")
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=1
pkgdesc="A wrapper for the Uptime Kuma Socket.IO API"
arch=('any')
url="https://github.com/lucasheld/uptime-kuma-api"
license=('MIT')
depends=('python-packaging'
         'python-socketio')

makedepends=('python-wheel'
             'python-build'
             'python-installer'
             'python-setuptools')

source=("${_name}-${pkgver}.tar.gz::https://github.com/lucasheld/uptime-kuma-api/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a526986bf8c52b5896cc299c9542b96893ab4063dbac82693f1414b33ef4a6ee')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
