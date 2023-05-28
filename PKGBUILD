# Maintainer: Stefan Naumann <me@stefannaumann.de>
pkgname=swayrandr
pkgver=1.0
pkgrel=1
pkgdesc="xrandr and lxrandr clone for Sway tiling wayland compositor."
arch=('any')
url="https://codeberg.org/snaums/swayrandr"
license=('GPL-3')
depends=('sway')
makedepends=(
  'go'
  'git'
)
source=("swayrandr::git+https://codeberg.org/snaums/swayrandr.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --always
}

build() {
  cd "$srcdir/$pkgname"
  make dist
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 swayrandr "$pkgdir/usr/bin/swayrandr"
  install -Dm755 lswayrandr "$pkgdir/usr/bin/lswayrandr"
}

