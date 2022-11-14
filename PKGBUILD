# Maintainer: Andrey Alekseev <andrey.android7890@gmail.com>

pkgname=('bootsplash-theme-manjaro-space-purple-git')
pkgver=1.1.r0.g7f2390e
pkgrel=2
arch=('x86_64')
pkgdesc="Beautiful Manjaro Bootsplash with space animation"
url="https://github.com/parov0z/bootsplash-theme-manjaro-space-purple"
license=('GPL')
depends=()
optdepends=('bootsplash-systemd: for bootsplash functionality')
makedepends=('imagemagick' 'git')
source=('git+https://github.com/parov0z/bootsplash-theme-manjaro-space-purple.git')
sha256sums=('SKIP')

pkgver() {
  cd "bootsplash-theme-manjaro-space-purple"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
} 

build() {
  cd "$srcdir"/"bootsplash-theme-manjaro-space-purple"
  sh ./bootsplash-manjaro-space.sh
}

package() {
  pkgdesc="Beautiful Manjaro Bootsplash with space animation"
  cd "$srcdir"

  install -Dm644 "$srcdir/bootsplash-theme-manjaro-space-purple/bootsplash-manjaro-space-purple" "$pkgdir/usr/lib/firmware/bootsplash-themes/manjaro-space-purple/bootsplash"
  install -Dm644 "$srcdir/bootsplash-theme-manjaro-space-purple/bootsplash-manjaro-space-purple.initcpio_install" "$pkgdir/usr/lib/initcpio/install/bootsplash-manjaro-space-purple"
}
