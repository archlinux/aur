# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=yutto
pkgver=2.0.0b18
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
sha256sums=('06eb9b7f24907f0e258d64dcd72c96e19aa57b45538a614b43a7a7640de3a1e4')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
