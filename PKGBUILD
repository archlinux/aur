# Contributor: Bruce Zhang <zttt183525594@gmail.com>

pkgname=python-bilibili-api
pkgver=17.4.0
pkgrel=1
pkgdesc="哔哩哔哩常用API调用。支持视频、番剧、用户、频道、音频等功能。"
arch=('any')
url="https://nemo2011.github.io/bilibili-api/"
license=('GPL-3.0-or-later')
depends=('python' 'python-beautifulsoup4' 'python-yaml' 'python-brotli' 'python-yarl' 'python-lxml'
         'python-qrcode' 'python-apscheduler' 'python-pillow' 'python-pycryptodomex' 'python-qrcode_terminal'
         'python-pyjwt')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools-scm')
optdepends=('python-curl-cffi: At least one is required to send http request.'
            'python-aiohttp: At least one is required to send http request.'
            'python-httpx: At least one is required to send http request.'
            'python-pyqt6: Run ivitools.'
            'python-colorama: Run ivitools.')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nemo2011/bilibili-api/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('1c051df89a427181023788ef11656ab732fc4b8bee01fc5fcb4397dafd01aa69855e8a5cadfe62e0e81e0764a29f88a04ca8abfb67063e06a002ed4d4d3db2a6')

build() {
  cd bilibili-api-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd bilibili-api-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
