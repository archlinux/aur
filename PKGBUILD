# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=bilili
pkgver=1.4.5
pkgrel=1
pkgdesc='bilibili video and danmaku downloader | B站视频、弹幕下载器'
arch=('any')
url='https://github.com/SigureMo/bilili'
license=('GPL3')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6015a0f49971300ad9e7d414fa9350b66548ee766a58a276b5c809e31b966b1e')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
