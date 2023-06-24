# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=yutto
pkgver=2.0.0b27
pkgrel=2
pkgdesc='一个可爱且任性的 B 站视频下载器'
arch=('any')
url='https://github.com/yutto-dev/yutto'
license=('GPL3')
depends=(
    'python-aiohttp'
    'python-aiofiles'
    'python-biliass'
    'python-dict2xml'
    'ffmpeg'
)
makedepends=(python-build python-installer python-wheel python-poetry-core)
optdepends=('python-uvloop: fast asyncio event loop')
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('cb795b8d4557549277f60f1621752bd09c7defe0a2e133aef3d83395b8b0412e')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
