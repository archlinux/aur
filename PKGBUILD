# Maintainer: David Schury <dasc@posteo.de>

pkgname=battery-checker-git
_pkgname=battery-checker
pkgver=1.1
pkgrel=1
pkgdesc="Script determining if the laptop battery is low"
url="https://gitlab.com/daersc/battery-checker"
arch=('any')
license=('GPL3')
depends=('libnotify')
conflicts=('battery-checker')
provides=('battery-checker')
source=("git+https://gitlab.com/daersc/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd $srcdir/$_pkgname
	git describe --tags | sed -e 's|-|.|g' -e 's|^v||'
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/$_pkgname/check-battery $pkgdir/usr/bin
}
