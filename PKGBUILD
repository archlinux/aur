# Maintainer: Andrey Alekseev <andrey.android7890@gmail.com>

pkgname=('bootsplash-theme-manjaro-glitch')
pkgver=1.0
pkgrel=1
arch=('x86_64')
pkgdesc="Simple Manjaro Bootsplash with cool glitch effect"
license=('GPL')
depends=()
optdepends=('bootsplash-systemd: for bootsplash functionality')
builddepends=('imagemagick')
options=('!libtool' '!emptydirs')

source=('bootsplash-packer'
	'bootsplash-manjaro-glitch.sh'
	'bootsplash-manjaro-glitch.initcpio_install'
	'logo.png'
	'logo.tar.xz::https://github.com/ANDRoid7890/bootsplash-theme-manjaro-glitch/blob/master/logo.tar.xz')

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
  cd "$srcdir"
  bsdtar -xf logo.tar.xz
  sh ./bootsplash-manjaro-glitch.sh
}

package_bootsplash-theme-manjaro-glitch() {
  pkgdesc="Simple Manjaro Bootsplash with cool glitch effect"
  cd "$srcdir"

  install -Dm644 "$srcdir/bootsplash-manjaro-glitch" "$pkgdir/usr/lib/firmware/bootsplash-themes/manjaro-glitch/bootsplash"
  install -Dm644 "$srcdir/bootsplash-manjaro-glitch.initcpio_install" "$pkgdir/usr/lib/initcpio/install/bootsplash-manjaro-glitch"
}
