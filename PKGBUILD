# Maintainer: Molchanov Alexandr <amol4anov@mail.ru>

pkgname=('bootsplash-theme-sakura-git')
pkgver=1.0.r3.g20ddd41
pkgrel=1
arch=('x86_64')
pkgdesc="Simple Bootsplash Sakura Theme"
url="https://github.com/LinAnsty/bootsplash-theme-sakura"
license=('GPL')
depends=()
optdepends=('bootsplash-systemd: for bootsplash functionality')
makedepends=('imagemagick' 'git')
options=('!libtool' '!emptydirs')
source=('git+https://github.com/LinAnsty/bootsplash-theme-sakura.git')

sha256sums=('SKIP')

pkgver() {
	cd "bootsplash-theme-sakura"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/"bootsplash-theme-sakura"
  sh ./bootsplash-sakura.sh
}

package() {
  pkgdesc="Bootsplash with cool sakura tree"
  cd "$srcdir"

  install -Dm644 "$srcdir/bootsplash-theme-sakura/bootsplash-sakura" "$pkgdir/usr/lib/firmware/bootsplash-themes/sakura/bootsplash"
  install -Dm644 "$srcdir/bootsplash-theme-sakura/bootsplash-sakura.initcpio_install" "$pkgdir/usr/lib/initcpio/install/bootsplash-sakura"
}
