# Maintainer: Atmosphera App <atmosphera-app@proton.me>

pkgname=atmosphera
pkgver=0.3.1
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
sha256sums=('7dcaa308518c87dfd090282bda784acc7ed8e8d72c37a0aff7c22974f3576158')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/etc/xdg/quickshell/atmosphera"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/atmosphera/"
}
