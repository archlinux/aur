# Maintainer: Atmosphera App <atmosphera-app@proton.me>

pkgname=atmosphera
pkgver=0.2.0
pkgrel=1
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
sha256sums=('f48bdb071852f3391c9de8412aa350646dc854c725f99bd4e544c252a9768252')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/etc/xdg/quickshell/atmosphera"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/atmosphera/"
}
