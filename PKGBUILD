# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=yutto
pkgver=2.1.0b1
pkgrel=1
pkgdesc='一个可爱且任性的 B 站视频下载器'
arch=('any')
url='https://github.com/yutto-dev/yutto'
license=('GPL-3.0-only')
# same order as https://github.com/yutto-dev/yutto/blob/main/pyproject.toml
depends=(
    'python-aiofiles'
    'python-biliass'
    'python-typing_extensions'
    'python-dict2xml'
    'python-httpx'
    'python-h2'
    'python-socksio'
    'python-pydantic'
    'python-returns'
    'ffmpeg'
)
optdepends=(
    'python-fastmcp: Model Context Protocol support'
)
makedepends=(python-build python-installer python-wheel python-uv-build)
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6cc15d336794efaa6b68740a01aa62bc69b755d42840e9553223553c9c4dc49c')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
