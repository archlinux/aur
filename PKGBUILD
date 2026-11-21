# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=fabric-d77
pkgver=1.6.0
pkgrel=1
pkgdesc="GTK desktop shell for Wayland compositors, built on Fabric"
arch=('any')
url="https://github.com/dani-77/fabric-d77"
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'python-cairo'
  'python-cffi'
  'python-click'
  'python-loguru'
  'python-pillow'
  'python-psutil'
  'python-rapidfuzz'
  'python-requests'
  'python-setproctitle'
  'python-six'
  'python-pam'
  'python-thefuzz'
  'python-fabric'
  'gtk-session-lock'
  'alsa-utils'
  'brightnessctl'
  'eww'
  'dgop'
)
optdepends=(
  'awww: wallpaper picker backend'
  'cmus: music picker and dashboard player controls'
  'ffmpeg: read artist/album tags in the music picker (ffprobe)'
  'xdg-user-dirs: locate the music folder'
  'xdg-terminal-exec: pick the default terminal when $TERMINAL is unset'
  'ollama: backend for the Ollama Chat popup'
  'matugen: wallpaper-based color palette'
)
backup=('etc/pam.d/fabric-d77')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('931401a6b1dfdbc6b97e4ca48f88e1fa273dfbd3395f03c269f166f075d5010c')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
