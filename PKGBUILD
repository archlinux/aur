# Maintainer: reimu <r2hkri at gmail com>
pkgname=swayblocks
pkgver=r45.9257a84
pkgrel=1
pkgdesc="a highly customizable, language agnostic status bar manager for i3 and sway written in elixir"
arch=("i686" "x86_64")
url="https://github.com/rei2hu/$pkgname"
license=("GPL")
conflicts=("$pkgname")
provides=("$pkgname")
depends=("elixir")
makedepends=("elixir")
optdepends=(
  "acpi: for battery script",
  "brightnessctl: for brightness script",
  "cmus: for cmus script",
  "alsa-utils: for volume script")
source=("git+$url")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make create
  make build
}

package() {
  mkdir -p "$pkgdir/usr/bin" && mv "$srcdir/$pkgname/swayblocks" "$pkgdir/usr/bin"
}
