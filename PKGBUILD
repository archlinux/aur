# batteryinfo PKGBUILD
# Maintainer: Joe Glancy <joe.glancy.dev@gmail.com>
pkgname=batteryinfo
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple battery status and information tool for Linux systems."
arch=('i686' 'x86_64')
url="https://github.com/JoeGlancy/batteryinfo"
license=('GPL3')
makedepends=('git')
source=('git://github.com/JoeGlancy/batteryinfo.git')
md5sums=('SKIP')

build() {
	cd "$srcdir/batteryinfo"
	make DESTDIR=/usr batteryinfo batteryinfo.1.gz
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/usr" install
}
