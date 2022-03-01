# Maintainer: MelianMiko <melianmiko@gmail.com>
pkgname=openfreebuds
pkgver=0.9
pkgrel=1
pkgdesc="Manager for HUAWEI FreeBuds (beta)"
arch=(any)
url="https://melianmiko.ru/openfreebuds"
license=('GPLv3')
depends=(python dbus-python python-gobject libappindicator-gtk3 libkeybinder3 gtk3 python-psutil bluez python-pillow)
makedepends=(make python-pip python)
source=("$pkgname-$pkgver::git+https://github.com/melianmiko/openfreebuds.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
        cd "$pkgname-$pkgver/OpenFreebuds_Desktop"
        make
}

package() {
        cd "$pkgname-$pkgver/OpenFreebuds_Desktop"
        make install DESTDIR="$pkgdir"
}

