# Maintainer: Andrey Alekseev <andrey.android7890@gmail.com>

pkgname=('bootsplash-theme-manjaro-space-green-git')
pkgver=1.1.r0.gdb831a0

pkgrel=2
arch=('x86_64')
pkgdesc="Beautiful Manjaro Bootsplash with space animation"
url="https://github.com/parov0z/bootsplash-theme-manjaro-space-green"
license=('GPL')
depends=()
optdepends=('bootsplash-systemd: for bootsplash functionality')
makedepends=('imagemagick' 'git')
source=('git+https://github.com/parov0z/bootsplash-theme-manjaro-space-green.git')
sha256sums=('SKIP')

pkgver() {
  cd "bootsplash-theme-manjaro-space-green"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
} 

build() {
  cd "$srcdir"/"bootsplash-theme-manjaro-space-green"
  sh ./bootsplash-manjaro-space.sh
}

package() {
  pkgdesc="Beautiful Manjaro Bootsplash with space animation"
  cd "$srcdir"

  install -Dm644 "$srcdir/bootsplash-theme-manjaro-space-green/bootsplash-manjaro-space-green" "$pkgdir/usr/lib/firmware/bootsplash-themes/manjaro-space-green/bootsplash"
  install -Dm644 "$srcdir/bootsplash-theme-manjaro-space-green/bootsplash-manjaro-space-green.initcpio_install" "$pkgdir/usr/lib/initcpio/install/bootsplash-manjaro-space-green"
}
