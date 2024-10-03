# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=yutto
pkgver=2.0.0rc1
pkgrel=1
pkgdesc='一个可爱且任性的 B 站视频下载器'
arch=('any')
url='https://github.com/yutto-dev/yutto'
license=('GPL-3.0-only')
depends=(
    'python-aiofiles'
    'python-biliass'
    'python-typing_extensions'
    'python-dict2xml'
    'python-httpx'
    'python-h2'
    'python-socksio'
    'ffmpeg'
)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('cd09981c0539f71b0a4b284a6e983dc1d79cd38d44d615c98f1b8f2ae594d256')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
