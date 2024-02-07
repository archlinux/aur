# Maintainer: MelianMiko <melianmiko@gmail.com>
pkgname=openfreebuds
pkgver=0.13.1
pkgrel=1
pkgdesc="Manager for HUAWEI FreeBuds"
arch=(any)
url="https://melianmiko.ru/openfreebuds"
license=('GPLv3')
depends=(python dbus-python python-gobject libappindicator-gtk3 gtk3 tk bluez python-pillow python-six python-xlib python-psutil)
makedepends=(make python-pip python)
source=("$pkgname-$pkgver::git+https://github.com/melianmiko/openfreebuds.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver/"
	make
}

package() {
	cd "$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir"
}

