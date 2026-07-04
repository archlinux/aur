# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-dingtalk-stream
pkgver=0.24.3
pkgrel=1
pkgdesc="DingTalk Stream Mode API - Python SDK"
arch=('any')
url="https://github.com/open-dingtalk/dingtalk-stream-sdk-python"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python-websockets' 'python-requests' 'python-aiohttp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-dingtalk/dingtalk-stream-sdk-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f46bcfe2cc654159927b16ec6569459bddd8f49b1e1b701248b325a51a604a70')

_srcdir="dingtalk-stream-sdk-python-$pkgver"

build() {
    cd "$srcdir/$_srcdir"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_srcdir"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
