# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=musl-gcc-cross-bin
pkgver=15.2.0
pkgrel=20251207
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

sha256sums_i686=('d19646cdd4733b767ccfd26095adb2c96ca1e97e1c0f77dec53143c177cd2b67')
sha256sums_x86_64=('c184ef8f059d7cc573437de2b3615454c2d8306126694895bace0fb9adb37d68')
sha256sums_aarch64=('feff1845d60aa5c773cd3f739f389c82e298781dc687de89eb8e3f0ab01bdb74')
sha256sums_armv7h=('fc4efa37d233b1628da04cda300161203ca0151471161ad65628a2fb5e2f78ed')

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
