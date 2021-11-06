# Maintainer: Gr3q <floyd0122@gmail.com>

_pkgname=yt-dlg
pkgname=$_pkgname
pkgver=1.8.1
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
sha512sums=('0871f1944e9a81570f02c040d43f6dd06c883f27451d57b697f277a9be0fb21655c757bcbe961a04ed16e9329f3502cbe740d7734842a0031af9bb3156d7fbc7')

package() {
  cd youtube-dl-gui-"${pkgver}"
  install -Dm644 yt-dlg.desktop "$pkgdir/usr/share/applications/yt-dlg.desktop"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py build_trans install --root="$pkgdir" --optimize=1
}

