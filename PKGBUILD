# Maintainer: exu <aur _a_ frm01 _d_ net>

pkgname=streamrip
pkgver=2.1.0
pkgrel=1
pkgdesc='A scriptable stream downloader for Qobuz, Tidal, Deezer and SoundCloud.'
arch=(any)
url='https://github.com/nathom/streamrip'
license=('GPL3')
depends=(python
  python-aiodns
  python-aiofiles
  python-aiohttp
  python-aiolimiter # AUR
  python-appdirs
  python-click-help-colors
  python-deezer-py # AUR
  python-m3u8      # AUR
  python-mutagen
  python-pathvalidate # AUR
  python-pillow
  python-pycryptodomex
  python-pytest-asyncio
  python-pytest-mock
  python-rich
  python-simple-term-menu
  python-tomlkit
  python-requests)
makedepends=(git
  python-build
  python-installer
  python-poetry)
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
