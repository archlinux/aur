# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=musl-gcc-cross-bin
pkgver=15.2.0
pkgrel=20260204
pkgdesc='A GCC cross-compiler targeting Linux musl'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/AmanoTeam/Raiden'
license=('LGPL-3.0')
depends=()
optdepends=()
provides=('musl-gcc-cross')
conflicts=('musl-gcc-cross')
options=('!strip' 'staticlibs')

source_i686=("https://github.com/AmanoTeam/Raiden/releases/download/gcc-${pkgver%%.*}/i386-unknown-linux-gnu.tar.xz")
source_x86_64=("https://github.com/AmanoTeam/Raiden/releases/download/gcc-${pkgver%%.*}/x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/AmanoTeam/Raiden/releases/download/gcc-${pkgver%%.*}/aarch64-unknown-linux-gnu.tar.xz")
source_armv7h=("https://github.com/AmanoTeam/Raiden/releases/download/gcc-${pkgver%%.*}/arm-unknown-linux-gnueabihf.tar.xz")

sha256sums_i686=('19423794353b5205aa862a7c61f499788e56bceb0e24df5d8199839d92c794de')
sha256sums_x86_64=('76104ab83a8f79ec4be6189cdc6c5fad2676f7d5ce1abbea481253dccaf51204')
sha256sums_aarch64=('21ea5ea6ff136a0c6376111b641de6df717415f02fe5f2f928c1bb8e0fe02d5a')
sha256sums_armv7h=('a01b55d4eca7ae968023258a50235ea2f3fe8d199c7089f6888b9308f122e949')

__alt_pkgname='raiden'

package() {
	
	mkdir \
		--parent \
		"${pkgdir}/opt" \
		"${pkgdir}/usr/bin"
	
	cp \
		--recursive \
		"${srcdir}/${__alt_pkgname}" \
		"${pkgdir}/opt"
	
	ln \
		--symbolic \
		--relative \
		"${pkgdir}/opt/${__alt_pkgname}/bin/"*'-unknown-linux-musl'* \
		"${pkgdir}/usr/bin"
	
}
