# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=bilili
pkgver=1.4.11
pkgrel=1
pkgdesc='bilibili video and danmaku downloader | B站视频、弹幕下载器'
arch=('any')
url='https://github.com/SigureMo/bilili'
license=('GPL3')
depends=('python-requests' 'python-biliass' 'ffmpeg')
makedepends=('python-setuptools' 'python-wheel')
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('46e9628baac596f045ef6ee3cff01ee8cd4f40eb51a2aa706c13c09411a0d9e9')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    rm -rf "$pkgdir/usr/lib/"*"/site-packages/tests" || true
}
