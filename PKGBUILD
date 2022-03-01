# Maintainer: MelianMiko <melianmiko@gmail.com>
pkgname=openfreebuds
pkgver=0.8
pkgrel=1
pkgdesc="Manager for HUAWEI FreeBuds (beta)"
arch=(any)
url="https://melianmiko.ru/openfreebuds"
license=('GPLv3')
depends=(python dbus-python python-gobject libappindicator-gtk3 libkeybinder3 gtk3 python-psutil bluez)
makedepends=(make python-pip python)
source=("$pkgname-$pkgver::git+https://github.com/melianmiko/mibandpreview.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}

