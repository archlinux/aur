# Maintainer: Meade And Emily <thedarkula2049@gmail.com>
pkgname=brewstillery
pkgver=1.1.0
pkgrel=1
pkgdesc="BrewStillery is a brewer's, vintner's, and distiller's calculator. It has a multitude of great functions, such as calculating ABV, determining carbonation, and total sparge water needed."
url="https://monkeylog.in"
arch=('i686' 'x86_64')
license=('AGPL3')
makedepends=('git' 'cargo')
provides=('brewstillery')
conflicts=('brewstillery')
source=('git://github.com/MonkeyLog/BrewStillery')
md5sums=('SKIP')

build() {
	cd BrewStillery
	cargo build --release
}

package() {
	cd $srcdir/BrewStillery/target/release
  install -Dm755 BrewStillery "$pkgdir/usr/bin/BrewStillery"
	cd $srcdir/BrewStillery/Arch
	install -Dm755 BrewStillery.desktop "$pkgdir/usr/share/applications/BrewStillery.desktop"
	cd $srcdir/BrewStillery/media
	install -Dm755 BrewStilleryIcon.svg "$pkgdir/usr/share/BrewStillery/BrewStilleryIcon.svg"
	install -Dm755 BrewStilleryLogo.svg "$pkgdir/usr/share/BrewStillery/BrewStilleryLogo.svg"
}
