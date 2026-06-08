# Maintainer: Atmosphera App <atmosphera-app@proton.me>

pkgname=atmosphera-git
pkgver=0.1.0.r0.g0000000
pkgrel=2
pkgdesc="Atmosphera - a customizable desktop shell for Niri and Hyprland, built with Quickshell (git version)"
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
provides=('atmosphera')
conflicts=('atmosphera')
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/atmosphera"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
  cd "$srcdir/atmosphera"

  install -dm755 "$pkgdir/etc/xdg/quickshell/atmosphera"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/atmosphera/"
}
