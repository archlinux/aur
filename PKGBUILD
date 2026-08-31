# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=yutto
pkgver=2.3.1
pkgrel=1
pkgdesc='一个可爱且任性的 B 站视频下载器'
arch=('any')
url='https://github.com/yutto-dev/yutto'
license=('GPL-3.0-only')
# same order as https://github.com/yutto-dev/yutto/blob/main/pyproject.toml
depends=(
    'python-biliass'
    'python-typing_extensions'
    'python-dict2xml'
    'python-pydantic'
    'python-returns'
    'python-segno'
    'python-websockets'
    'ffmpeg'
)
makedepends=(python-build python-installer python-wheel python-maturin)
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('c1f6558feea22412151d86ef3c415fcc4a6c03dc270171eca2916b5e25ca9bce')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
