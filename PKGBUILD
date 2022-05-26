# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=bilili
pkgver=1.4.12
pkgrel=1
pkgdesc='bilibili video and danmaku downloader | B站视频、弹幕下载器'
arch=('any')
url='https://github.com/SigureMo/bilili'
license=('GPL3')
depends=('python-requests' 'python-biliass' 'ffmpeg')
makedepends=('python-setuptools' 'python-wheel')
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('93631af491a80ae5f6a15a7d31a5d6d8e522ea17629ea4f2704bedce98a3767a')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    rm -rf "$pkgdir/usr/lib/"*"/site-packages/tests" || true
}
