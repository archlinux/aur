# Maintainer: Max Ebert <Pesticide3902@proton.me>

_name=Moodle-DL
pkgname=moodle-dl
pkgver=2.3.13
pkgrel=1
pkgdesc='A Moodle downloader that downloads course content fast from Moodle (eg. lecture pdfs)'
arch=('any')
url='https://github.com/C0D3D3V/Moodle-DL'
license=('GPL3')
depends=('ffmpeg'
         'python>=3.7'
         'python-aiodns>=3.0.0'
         'python-aiofiles>=22.1.0'
         'python-aiohttp>=3.8.4'
         'python-certifi>=2020.4.5.2'
         'python-colorama>=0.4.6'
         'python-colorlog>=6.7.0'
         'python-html2text>=2020.1.16'
         'python-readchar>=4.0.3'
         'python-requests>=2.24.0'
         'python-sentry_sdk>=0.13.5'
         'python-xmpppy>=0.7.1'
         'yt-dlp>=2021.10.22')
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://github.com/C0D3D3V/Moodle-DL/archive/$pkgver.tar.gz")
b2sums=('SKIP')

build() {
    cd "${srcdir}/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
