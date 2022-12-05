# Maintainer: parovoz <andrey.android7890@gmail.com>

pkgname=('bootsplash-theme-manjaro-glitch-git')
pkgver=1.0.r0.g320c1af
pkgrel=2
arch=('x86_64')
pkgdesc="Simple Manjaro Bootsplash with cool glitch effect"
url="https://github.com/parov0z/bootsplash-theme-manjaro-glitch"
license=('GPL')
depends=()
optdepends=('bootsplash-systemd: for bootsplash functionality')
makedepends=('imagemagick' 'git')
source=('git+https://github.com/parov0z/bootsplash-theme-manjaro-glitch.git')
sha256sums=('SKIP')

pkgver() {
  cd "bootsplash-theme-manjaro-glitch"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
} 

build() {
  cd "$srcdir"/"bootsplash-theme-manjaro-glitch"
  sh ./bootsplash-manjaro-glitch.sh
}

package() {
  pkgdesc="Simple Manjaro Bootsplash with cool glitch effect"
  cd "$srcdir"

  install -Dm644 "$srcdir/bootsplash-theme-manjaro-glitch/bootsplash-manjaro-glitch" "$pkgdir/usr/lib/firmware/bootsplash-themes/manjaro-glitch/bootsplash"
  install -Dm644 "$srcdir/bootsplash-theme-manjaro-glitch/bootsplash-manjaro-glitch.initcpio_install" "$pkgdir/usr/lib/initcpio/install/bootsplash-manjaro-glitch"
}
