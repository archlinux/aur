# Maintainer: DBeidachazi <https://github.com/DBeidachazi>
# Based on the noctalia-shell PKGBUILD by Kevin <github@kev314.dev> and Lysec <itslysec@gmail.com>
pkgname=noctalia-legacy-v4
_pkgname=noctalia-shell
pkgver=4.7.8
pkgrel=1
pkgdesc="Community-maintained legacy Noctalia v4 desktop shell for Wayland, built with Quickshell"
arch=('any')
url="https://github.com/DBeidachazi/noctalia-shell"
license=('MIT')
depends=(
  'noctalia-qs'
  'qt6-declarative>=6.11'
  'qt6-multimedia'
  'imagemagick'
  'brightnessctl'
  'ffmpeg'
  'python'
  'wlr-randr'
)
optdepends=(
  'cliphist: For clipboard history support'
  'wlsunset: For supporting NightLight'
  'power-profiles-daemon: For power profile management'
  'ddcutil: For external display brightness control'
  'evolution-data-server: For calendar integration'
  'python-gobject: For calendar integration'
  'python-dateutil: For calendar integration'
)
provides=('noctalia-shell')
conflicts=('noctalia-shell' 'noctalia-shell-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('adafda0aa4a47870f02112d2cad93b92aa523c5747d5026e3ecd7189bccaa6f0')

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia-shell"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/noctalia-shell/"
  rm -rf "$pkgdir/etc/xdg/quickshell/noctalia-shell/packaging"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
