# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=bilili
pkgver=1.4.8
pkgrel=5
pkgdesc='bilibili video and danmaku downloader | B站视频、弹幕下载器'
arch=('any')
url='https://github.com/SigureMo/bilili'
license=('GPL3')
depends=('python-requests' 'python-biliass')
makedepends=('python-setuptools' 'python-wheel')
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9c74f3f8a4dd5eb5db4bb884cd8de9ba1c19d1c3b736589b0504e773050fe32e')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    rm -rf "$pkgdir/usr/lib/"*"/site-packages/tests" || true
}
