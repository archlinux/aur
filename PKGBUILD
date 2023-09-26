#Maintainer: anonion <aur at anonion dot social>

pkgname=("python-uptime-kuma-api")
_name=${pkgname#python-}
pkgver=1.2.1
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
sha256sums=('76366fb3e3f7dd1bbb0e0ef1f012ee218b5d42a14f29df6fae7bdfb58098a537')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
