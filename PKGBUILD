# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=yutto
pkgver=2.0.0b25
pkgrel=1
pkgdesc='一个可爱且任性的 B 站视频下载器'
arch=('any')
url='https://github.com/yutto-dev/yutto'
license=('GPL3')
depends=(
    'python-aiohttp'
    'python-aiofiles'
    'python-biliass'
    'python-dicttoxml'
    'ffmpeg'
)
makedepends=(python-build python-installer python-wheel python-poetry-core)
optdepends=('python-uvloop: fast asyncio event loop')
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0176bcb79c5086cc0fb25ccbc30ed71e2d1aee2f3ea9b34047cd97109f3c2dfc')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
