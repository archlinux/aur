# Maintainer: Reimar <mail@reim.ar>
pkgname=mcstatus-cli
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="A command-line tool for viewing the current status of a Minecraft server"
arch=('x86_64')
url="https://github.com/ReimarPB/MCStatus"
license=('GPL')
groups=()
depends=('cjson')
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ReimarPB/MCStatus/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('15284e896e9af23fe7ac516456b8f5619d2da94848567e0b9286d490eb026846')
validpgpkeys=()

prepare() {
	cd "$srcdir/MCStatus-$pkgver"
}

build() {
	cd "$srcdir/MCStatus-$pkgver"
	make
}

package() {
	cd "$srcdir/MCStatus-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make prefix="$pkgdir/usr" install
}
