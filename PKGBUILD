# Maintainer: Andrey Alekseev <andrey.android7890@gmail.com>

pkgname=('bootsplash-theme-manjaro-glitch-git')
pkgver=v1.0.r0.g320c1af
pkgrel=2
arch=('x86_64')
pkgdesc="Simple Manjaro Bootsplash with cool glitch effect"
url="https://github.com/ANDRoid7890/bootsplash-theme-manjaro-glitch"
license=('GPL')
depends=()
optdepends=('bootsplash-systemd: for bootsplash functionality')
builddepends=('imagemagick')
options=('!libtool' '!emptydirs')
source=('git+https://github.com/ANDRoid7890/bootsplash-theme-manjaro-glitch.git')
sha256sums=('SKIP')

pkgver() {
  cd "bootsplash-theme-manjaro-glitch"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
