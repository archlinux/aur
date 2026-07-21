# Maintainer: Atmosphera App <atmosphera-app@proton.me>

pkgname=atmosphera
pkgver=0.3.0
pkgrel=1
pkgdesc="Atmosphera - a customizable desktop shell for Niri and Hyprland, built with Quickshell"
arch=('any')
url="https://github.com/alexindigo/atmosphera"
license=('GPL-3.0-or-later')
makedepends=()
depends=(
  'noctalia-qs'
  'qt6-dbusqml'
  'imagemagick'
  'brightnessctl'
  'ffmpeg'
  'qt6-multimedia'
  'python'
  'wlr-randr'
)
optdepends=(
  'cliphist: For clipboard history support'
  'wlsunset: For supporting NightLight'
  'power-profiles-daemon: For power profile management'
  'ddcutil: For external display brightness control'
)
conflicts=('atmosphera-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5880355cc470f73ab090be0fe93f0844ce0b5eb081d8843fb3be15fae66ec391')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/etc/xdg/quickshell/atmosphera"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/atmosphera/"
}
