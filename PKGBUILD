# Maintainer: Andrey Alekseev <andrey.android7890@gmail.com>

pkgname=('bootsplash-theme-manjaro-glitch')
pkgver=1.0
pkgrel=1
url="https://github.com/tchavei/bootsplash-manjaro-glitch"
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
	'logo.tar.xz')

sha256sums=('51559d3ccfb448b03fa6439faf5869dbd0c2fbda1b5d5bf5d4ba70e60937472a'
            '92e7ef05c0bf03f53e5ac081631c3a2852af9342ca84c2347f88113c02412408'
            'cb12145581e1d82db89cde1f79429933fc682baa2b34c26b7f1c9e670ceac588'
            '1bcc3ce7a25b52c925de7a40e807ef6aa7a43c1180c003f11c39a95d12f80886')

build() {
  cd "$srcdir"
  bsdtar -xf logo.tar.xz
  sh ./bootsplash-manjaro-glitch.sh
}

package_bootsplash-theme-manjaro-glitch() {
  pkgdesc="Bootsplash Theme 'Manjaro glitch'"
  cd "$srcdir"

  install -Dm644 "$srcdir/bootsplash-manjaro-glitch" "$pkgdir/usr/lib/firmware/bootsplash-themes/manjaro-glitch/bootsplash"
  install -Dm644 "$srcdir/bootsplash-manjaro-glitch.initcpio_install" "$pkgdir/usr/lib/initcpio/install/bootsplash-manjaro-glitch"
}
