# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=bilili
pkgver=1.4.3
pkgrel=1
pkgdesc='bilibili video and danmaku downloader | B站视频、弹幕下载器'
arch=('any')
url='https://github.com/SigureMo/bilili'
license=('GPL3')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('20339be40e269cd8cfc64399a6018f3759640c7ea7ff5e3f1a6f87b3488c9531')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
