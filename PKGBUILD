# Maintainer: Miłosz Bliźniak <mibli@gmx.com>
pkgname=cnoti-git
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="little DBus notification monitor lib with noticat utility"
arch=('x86_64')
url="https://github.com/mibli/cnoti"
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
source=("$pkgname-$pkgver.zip::https://github.com/mibli/cnoti/archive/refs/tags/v$pkgver.zip")
noextract=()
md5sums=("6d8a4e20720d3b423296e3c8e40828e3")
validpgpkeys=()

build() {
	cd "cnoti-$pkgver"
	make VERSION=$pkgver USE_CJSON=YES all
}

package() {
	cd "cnoti-$pkgver"
	make VERSION=$pkgver DESTDIR="$pkgdir" prefix=/usr install
}
