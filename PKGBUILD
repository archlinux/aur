# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

# Tip: If your video doesn't play, take a look at "journalctl -b"

_pkgname=org.kde.video
pkgname=plasma5-wallpapers-video-git
pkgver=r4.f8ec6f9
pkgrel=1
pkgdesc="Allows the use of video wallpaper and lock screen."
arch=("any")
url="https://github.com/halverneus/org.kde.video"
license=('unknown')
optdepends=('gst-plugins-bad: more codecs' 'gst-plugins-ugly: more codecs')
makedepends=('git')
provides=("plasma5-wallpapers-video")
conflicts=("plasma5-wallpapers-video")
source=('git+https://github.com/halverneus/org.kde.video')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/share/plasma/wallpapers/$_pkgname"
  cp -r "$srcdir/$_pkgname/"* "$pkgdir/usr/share/plasma/wallpapers/$_pkgname"
}
