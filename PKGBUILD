# Maintainer: Lai Jiang <jianglai@msn.com>

pkgname=plezy-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="A beautiful Plex media server client built with Flutter"
arch=('x86_64')
url="https://github.com/edde746/plezy"
license=('GPL-3.0')
depends=(
  'gtk3'
  'mpv'
  'libepoxy'
  'alsa-lib'
  'libevdev'
  'glib2'
)
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::https://github.com/edde746/plezy/releases/download/${pkgver}/plezy-linux-x64.pkg.tar.zst")
sha256sums=('4f3f1911bc679b8d07b341a4051ede5b8b6dc39f88250f4b7e61e6fd1e6dffce')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

package() {
  # Extract the contents of the downloaded zst into the pkgdir
  # This works because makepkg automatically extracts the source to $srcdir
  cp -ra "$srcdir"/* "$pkgdir/"

  # Clean up: remove the original source archive if it was extracted into $pkgdir
  rm -rf "${pkgdir}/${pkgname%-bin}-${pkgver}.pkg.tar.zst"
}
