# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=motomagx-gcc-cross-bin
pkgver=15.2.0
pkgrel=20260303
pkgdesc='A GCC cross-compiler targeting MotoMAGX'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/AmanoTeam/motomagx-gcc-cross'
license=('LGPL-3.0')
depends=()
optdepends=()
provides=('motomagx-gcc-cross')
conflicts=('motomagx-gcc-cross')
options=('!strip' '!debug' '!docs' 'staticlibs')

source_i686=("https://github.com/AmanoTeam/motomagx-gcc-cross/releases/download/gcc-${pkgver%%.*}/i386-unknown-linux-gnu.tar.xz")
source_x86_64=("https://github.com/AmanoTeam/motomagx-gcc-cross/releases/download/gcc-${pkgver%%.*}/x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/AmanoTeam/motomagx-gcc-cross/releases/download/gcc-${pkgver%%.*}/aarch64-unknown-linux-gnu.tar.xz")
source_armv7h=("https://github.com/AmanoTeam/motomagx-gcc-cross/releases/download/gcc-${pkgver%%.*}/arm-unknown-linux-gnueabihf.tar.xz")

sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')

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
		"${pkgdir}/opt/${pkgname/-bin/}/bin/"*'-unknown-linux-gnu'* \
		"${pkgdir}/usr/bin"
	
}
