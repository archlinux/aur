# Maintainer: reimu <r2hkri at gmail com>
pkgname=swayblocks
pkgver=0.0.5
pkgrel=1
pkgdesc="another block manager for i3bar/swaybar"
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

build() {
  cd "$srcdir/$pkgname"
  make create
  make build
}

package() {
  mkdir -p "$pkgdir/usr/bin" && mv "$srcdir/$pkgname/swayblocks" "$pkgdir/usr/bin"
}
