# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=obggcc-bin
pkgver=15.2.0
pkgrel=20260302
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

sha256sums_i686=('6385e4239c3292f6aa610e610a0b23b43cf36bb50ffb8826753543b126e9e436')
sha256sums_x86_64=('34c3cf9e27eaa63377c105662dc165f85edbe5294a26da0bd86c955850524b06')
sha256sums_aarch64=('79937afc6df66fe3d22b276fd51e01b3a613c98a5ab03a73093b736dcf06d211')
sha256sums_armv7h=('7fc232db2f78aadacf18a03e6f95376a1dbfe255c5a529d77413f03eedc7bbc1')

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
