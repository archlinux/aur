# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=fabric-d77
pkgver=1.4.0
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
# No upstream release tags yet: pinned to the same commit as the Void template
# in srcpkgs-d77. Bump _commit and sha256sums together.
_commit=e9ff15388823f1424b8b3c69a0654b7c629790a1
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('ca21c8b2e72ac05b8ce41fb068293ec6e720b1276378e7f8dc88d6dac949efcd')

package() {
    cd "$pkgname-$_commit"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
