# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=yutto
pkgver=2.1.0
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
sha256sums=('b7bf0f5aedb2a12079d6dc454bf30558c741719c029eea56c7ffbd25f076de56')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
