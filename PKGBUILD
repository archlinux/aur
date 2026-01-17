# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

_name="ws4py"
pkgname="python-${_name}"
pkgver=0.6.0
pkgrel=2
pkgdesc="WebSocket client and server library for Python"
url="https://github.com/Lawouach/WebSocket-for-Python"
license=("BSD")
arch=("any")
depends=("python")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
provides=("$_name" "$pkgname")
source=("$_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('d5dde49408a0d2384e3225ab5d4f741b887dca6979ee9ece75edc0251920a5075e07c3642c3bd24dbce130fc8a833bfbe5aebc4bb7771b267191587c9c88ff6e')

build(){
 cd "WebSocket-for-Python-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "WebSocket-for-Python-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=4 sw=4 ft=sh et:
