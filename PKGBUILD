# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=bilili
pkgver=1.4.14
pkgrel=1
pkgdesc='bilibili video and danmaku downloader | B站视频、弹幕下载器'
arch=('any')
url='https://github.com/yutto-dev/bilili'
license=('GPL3')
depends=('python-requests' 'python-biliass' 'ffmpeg')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('58c58e12f838fd355c016c0d9b2255c423c388d4ce7b2407928e6a0320ceff59')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
