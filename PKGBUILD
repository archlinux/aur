# Maintainer: Gr3q <floyd0122@gmail.com>

_pkgname=yt-dlg
pkgname=$_pkgname
pkgver=1.8.3
pkgrel=1
pkgdesc="A cross platform front-end GUI of the popular youtube-dl written in wxPython (maintained fork of youtube-dl-gui)"
arch=('any')
url="https://github.com/oleksis/youtube-dl-gui"
license=('custom:UNLICENSE')
depends=(
  'python-pypubsub'
  'python-wxpython'
  'xdg-utils'
)
optdepends=('ffmpeg: convert video files to audio-only files'
            'youtube-dl: alternative to the youtube-dl program downloaded by yt-dlg')
makedepends=('git' 'python-polib' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname youtube-dl-gui)
source=(https://github.com/oleksis/youtube-dl-gui/archive/refs/tags/v"${pkgver}".tar.gz)
sha512sums=('f56adb25baea489f21a57a5513d95e656835429b4512e49d848076afaa60fa356d3468cd5460fcc6e6f311bf605d959a78b4277a0ab272903dde25c2cc87ca8e')

package() {
  cd youtube-dl-gui-"${pkgver}"
  install -Dm644 yt-dlg.desktop "$pkgdir/usr/share/applications/yt-dlg.desktop"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py build_trans install --root="$pkgdir" --optimize=1
}

