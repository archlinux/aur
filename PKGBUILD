# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=yutto
pkgver=2.0.0b5
pkgrel=1
pkgdesc='一个可爱且任性的 B 站视频下载器'
arch=('any')
url='https://github.com/SigureMo/yutto'
license=('GPL3')
depends=(
    'python-aiohttp'
    'python-aiofiles'
    'python-biliass'
    'python-dicttoxml'
)
makedepends=('python-setuptools' 'python-wheel')
optdepends=('python-uvloop: fast asyncio event loop')
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('10a8363119bcfdca5c704b9e3781a376b34cc1adb93d62562ab58330a38da56d')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    rm -rf "$pkgdir/usr/lib/"*"/site-packages/tests" || true
}
