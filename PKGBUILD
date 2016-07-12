# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Peter <craven@gmx.net>
pkgname=pktriggercord
pkgver=0.84.00
pkgrel=1
epoch=
pkgdesc="Remote control (tethering) Linux (x86, arm), Windows, Android software for Pentax DSLR cameras."
arch=(i686 x86_64)
url="http://pktriggercord.melda.info/"
license=('LGPL')
groups=()
depends=()
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
source=("https://github.com/asalamon74/$pkgname/releases/download/v$pkgver/pkTriggerCord-$pkgver.src.tar.gz")
md5sums=('f2637dc688380dda2793d7fe8de4de6f')
noextract=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
        sed -i 's|PREFIX ?=.*|PREFIX = /usr|' Makefile
}

build() {
	cd "$pkgname-$pkgver"
	make LDFLAGS=-lm PREFIX=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
