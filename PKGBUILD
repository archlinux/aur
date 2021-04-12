# Maintainer: Westly Ward <sonicrules1234 at gmail dot com>
pkgname=magiwallet-magid-ruckard-raspi4
pkgver=1.4.7.2
pkgrel=1
epoch=
pkgdesc="Updated magi wallet that builds on modern systems by ruckard.  For raspi4."
arch=('aarch64')
url="https://github.com/ruckard/magi/tree/1.4.7.2"
license=('MIT')
groups=()
depends=('db' 'boost' 'openssl' 'gmp' 'miniupnpc')
makedepends=()
checkdepends=()
optdepends=()
provides=("magid")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/ruckard/magi/archive/refs/tags/v1.4.7.2.tar.gz")
noextract=()
sha256sums=("c2cd773340adec2e988de11606ff2118f7ee79109d33ad5bced5f98bbaba8424")
#md5sums=()
validpgpkeys=()

prepare() {
	cd "magi-1.4.7.2"
}

build() {
	cd "magi-1.4.7.2/src"
	make -f makefile.unix xCPUARCH=aarch64 -j3
}

package() {
	cd "magi-1.4.7.2"
	install -Dm775 "src/magid" "${pkgdir}/usr/bin/magid"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
