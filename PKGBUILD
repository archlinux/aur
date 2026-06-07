# Maintainer: Atmosphera App <atmosphera-app@proton.me>

pkgname=atmosphera
pkgver=0.1.0
pkgrel=1
pkgdesc="Atmosphera - a customizable desktop shell for Niri and Hyprland, built with Quickshell"
arch=('any')
url="https://github.com/alexindigo/atmosphera"
license=('GPL-3.0-or-later')
makedepends=('git')
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
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  install -dm755 "$pkgdir/etc/xdg/quickshell/atmosphera"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/atmosphera/"
}
