# Maintainer: RealStickman <mrc+aur _a_ frm01 _d_ net>

pkgname=streamrip
pkgver=2.0.5
pkgrel=1
pkgdesc='A scriptable stream downloader for Qobuz, Tidal, Deezer and SoundCloud.'
arch=(any)
url='https://github.com/nathom/streamrip'
license=('GPL3')
depends=(python
         python-mutagen
         python-tomlkit
         python-pathvalidate
         python-simple-term-menu
         python-pillow
         python-deezer-py
         python-pycryptodomex
         python-appdirs
         python-m3u8
         python-aiofiles
         python-aiohttp
         python-aiodns
         python-aiolimiter
         python-pytest-mock
         python-pytest-asyncio
         python-rich
         python-click-help-colors)
makedepends=(python-poetry
             python-{build,installer}
             git)
optdepends=('ffmpeg: Additional functionality')
source=(git+https://github.com/nathom/streamrip.git#tag=v$pkgver)
sha256sums=('SKIP')

pkgver() {
    cd streamrip
    printf "${pkgver//-/.}"
}

build() {
    cd streamrip
    python -m build -wn
}

package() {
    cd streamrip
    python -m installer -d "$pkgdir" dist/*.whl
}
