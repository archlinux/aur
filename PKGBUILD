# Maintainer: Gr3q <floyd0122@gmail.com>

_pkgname=yt-dlg
pkgname=$_pkgname
pkgver=1.8.2
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
sha512sums=('c231f4f615cb9331ed7dd6ad8f850596e04e5d6759d18b25704a1605ce47697a3f28f3eb1d64bf35e2d66ea05ea3ed256c20c80fd83c2ddb66689975fdda446f')

package() {
  cd youtube-dl-gui-"${pkgver}"
  install -Dm644 yt-dlg.desktop "$pkgdir/usr/share/applications/yt-dlg.desktop"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py build_trans install --root="$pkgdir" --optimize=1
}

