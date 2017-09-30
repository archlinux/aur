# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Giampaolo Mancini <mancho@trmpln.com> 
pkgname=mqtt-sn-tools
pkgver=0.0.6
pkgrel=1
epoch=
pkgdesc="Command line tools written in C for the MQTT-SN (MQTT For Sensor Networks) protocol"
arch=("x86_64" "armv7h")
url="Command line tools written in C for the MQTT-SN (MQTT For Sensor Networks) protocol "
license=('MIT' 'custom:LICENSE.md')
groups=()
depends=("glibc")
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
source=("https://github.com/njh/mqtt-sn-tools/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("107d762dcd9fe01dc2229dab480765224f10b027cb6dcb273a7a0987298c788a")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
        
	make prefix="usr" DESTDIR="$pkgdir/" install
        install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
