# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=obggcc-bin
pkgver=15.2.0
pkgrel=20260125
pkgdesc='Linux C/C++ cross-compiler targeting older glibc versions'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/AmanoTeam/obggcc'
license=('LGPL-3.0')
depends=()
optdepends=()
provides=('obggcc')
conflicts=('obggcc')
options=('!strip' 'staticlibs')

source_i686=("https://github.com/AmanoTeam/obggcc/releases/download/gcc-${pkgver%%.*}/i386-unknown-linux-gnu.tar.xz")
source_x86_64=("https://github.com/AmanoTeam/obggcc/releases/download/gcc-${pkgver%%.*}/x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/AmanoTeam/obggcc/releases/download/gcc-${pkgver%%.*}/aarch64-unknown-linux-gnu.tar.xz")
source_armv7h=("https://github.com/AmanoTeam/obggcc/releases/download/gcc-${pkgver%%.*}/arm-unknown-linux-gnueabihf.tar.xz")

sha256sums_i686=('1419df5d3e86a733ec0554b496bba9cadf5994eb9208f2576f7d81f04e507dd9')
sha256sums_x86_64=('0a32064a0b7315316118e3e8c0f619e78cfeec025a498571f4bc03d4a69e46cc')
sha256sums_aarch64=('4a3c6a1396e23cf7327c3155bf90c71d05de99de4e8a3681ce0ca79beb684a7d')
sha256sums_armv7h=('9941deabb22b7252847206ea8f2834c596ed13de3b5f2d5831161a3795fc9665')

package() {
	
	mkdir \
		--parent \
		"${pkgdir}/opt" \
		"${pkgdir}/usr/bin"
	
	cp \
		--recursive \
		"${srcdir}/${pkgname/-bin/}" \
		"${pkgdir}/opt"
	
	ln \
		--symbolic \
		--relative \
		"${pkgdir}/opt/${pkgname/-bin/}/bin/"*'-unknown-linux-gnu'*'2.'* \
		"${pkgdir}/usr/bin"
	
}
