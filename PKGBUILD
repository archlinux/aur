#Maintainer: anonion <aur at anonion dot social>

pkgname=("python-uptime-kuma-api")
_name=${pkgname#python-}
pkgver=1.1.0
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
sha256sums=('b564d4c5ca5308cf81a70615bd87c4804d14515e51e51169b8c58f27148846ff')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
