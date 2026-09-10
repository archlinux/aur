# Maintainer: PSGtatitos <psgtatitos@github>
# Contributor: PSGtatitos <psgtatitos@github>

pkgname=papyrus-wallpaper
pkgver=1.2.9
pkgrel=1
pkgdesc="Animated wallpaper manager for the COSMIC desktop — uses mpvpaper to play video wallpapers with playlist rotation, auto-theming, and self-update"
arch=('any')
url="https://github.com/PSGtatitos/papyrus"
license=('GPL3')
depends=(
  'python-gobject'
  'gtk4'
  'libadwaita'
  'ffmpeg'
  'python-pillow'
  'mpvpaper'
)
makedepends=()
optdepends=()
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c4ba9255a0261d8492a8a618f0b77d213cf2fcb67edf9f1a230ce96bafb97cc2')

package() {
  cd "$srcdir/papyrus-$pkgver"

  # Main script
  install -Dm755 papyrus.py "$pkgdir/usr/bin/papyrus"

  # Desktop file
  install -Dm644 io.github.PSGtatitos.papyrus.desktop \
    "$pkgdir/usr/share/applications/io.github.PSGtatitos.papyrus.desktop"

  # AppStream metainfo
  install -Dm644 io.github.PSGtatitos.papyrus.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.PSGtatitos.papyrus.metainfo.xml"

  # Icon
  install -Dm644 assets/icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.PSGtatitos.papyrus.png"
}
