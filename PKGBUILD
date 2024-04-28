# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=bilili
pkgver=1.4.15
pkgrel=2
pkgdesc='bilibili video and danmaku downloader | B站视频、弹幕下载器'
arch=('any')
url='https://github.com/yutto-dev/bilili'
license=('GPL-3.0-only')
depends=('python-requests' 'python-biliass' 'ffmpeg')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('902210cc3ac259af0d1b215fa9a16b059a62ee423b72985eb563b66e2b2800c1')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
