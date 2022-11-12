# Maintainer: Apple_QAQ <apple_qaq@outlook.com>

pkgname=python-bilibili-api-python
pkgver=13.2.0
pkgrel=1
pkgdesc="这是一个用 Python 写的调用 Bilibili 各种 API 的库， 范围涵盖视频、音频、直播、动态、专栏、用户、番剧等。"
arch=('any')
url="https://github.com/Nemo2011/bilibili-api"
license=('GPL3')
depends=('python' 'python-urllib3' 'python-aiohttp' 'python-beautifulsoup4' 'python-colorama' 'python-lxml' 'python-types-pyyaml' 'python-brotli' 'python-httpx' 'python-qrcode' 'python-requests' 'python-keyboard' 'python-apscheduler' 'python-rsa' 'python-pypng')
makedepends=('python-setuptools' 'python-pip')
source=("https://pypi.io/packages/source/b/bilibili-api-python/bilibili-api-python-$pkgver.tar.gz")
sha512sums=('adf43aee7a2c7f491af4d3a4b8d6232d33185a20cfc158252542cf34cee40355aad28967bc5df0fa5bdf3098faa4d8996605743ec2d71d56b320cf86314a50e0')

build() {
  cd bilibili-api-python-$pkgver
  python setup.py build
}

package() {
  cd bilibili-api-python-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}