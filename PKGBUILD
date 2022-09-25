# Maintainer: Miłosz Bliźniak <mibli@gmx.com>
pkgname=noti-git
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="little DBus notification monitor lib with noticat utility"
arch=('x86_64')
url="https://github.com/mibli/noti"
license=('MIT')
groups=()
depends=('cjson>=1.7.0' 'dbus>=1.14.0')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.zip::https://github.com/mibli/noti/archive/refs/tags/v$pkgver.zip")
noextract=()
md5sums=("6de95a62f4507cb297097d2386d07e48")
validpgpkeys=()

prepare() {
	cd "noti-$pkgver"
}

build() {
	cd "noti-$pkgver"
	make VERSION=$pkgver USE_CJSON=YES all
}

check() {
	pwd
	cd "noti-$pkgver"
}

package() {
	cd "noti-$pkgver"
	make VERSION=$pkgver DESTDIR="$pkgdir" prefix=/usr install
}
