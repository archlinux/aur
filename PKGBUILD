# Contributor: Matthew Bauer <mjbauer95@gmail.com>

_pkgname=ideviceactivate
pkgname=$_pkgname-git
pkgver=13.c450643
pkgrel=1
pkgdesc="Restores firmware and filesystem to iPhone/iPod Touch"
arch=('i686' 'x86_64')
url="http://github.com/posixninja/$_pkgname"
license=('custom')
depends=('usbmuxd' 'libirecovery-git' 'libimobiledevice>=1.1.0')
makedepends=('git')
source=(git://github.com/posixninja/$_pkgname)
md5sums=('SKIP')


pkgver() {
	cd $_pkgname
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	install -D $srcdir/$_pkgname/src/$_pkgname $pkgdir/usr/bin/$_pkgname
}
