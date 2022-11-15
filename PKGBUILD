# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=bilili
pkgver=1.4.13
pkgrel=1
pkgdesc='bilibili video and danmaku downloader | B站视频、弹幕下载器'
arch=('any')
url='https://github.com/SigureMo/bilili'
license=('GPL3')
depends=('python-requests' 'python-biliass' 'ffmpeg')
makedepends=('python-setuptools' 'python-wheel')
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('78aae85dbf82c9e35db13e8ca1b02b419f0e426126ad6b8c0307f2d290032752')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    rm -rf "$pkgdir/usr/lib/"*"/site-packages/tests" || true
}
