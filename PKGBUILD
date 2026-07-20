# Maintainer: Atmosphera App <atmosphera-app@proton.me>

pkgname=atmosphera
pkgver=0.1.0
pkgrel=2
pkgdesc="Atmosphera - a customizable desktop shell for Niri and Hyprland, built with Quickshell"
arch=('any')
url="https://github.com/alexindigo/atmosphera"
license=('GPL-3.0-or-later')
makedepends=()
depends=(
  'noctalia-qs'
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
sha256sums=('25cbb9b3f80eba7242ebc668f697ecf75596904e34b494398a652e88b1ce41ce')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/etc/xdg/quickshell/atmosphera"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/atmosphera/"
}
