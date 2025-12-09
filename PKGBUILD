# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=freebsd-gcc-cross-bin
pkgver=15.2.0
pkgrel=20251209
pkgdesc='A GCC cross-compiler targeting FreeBSD'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/AmanoTeam/Loki'
license=('LGPL-3.0')
depends=()
optdepends=()
provides=('freebsd-gcc-cross')
conflicts=('freebsd-gcc-cross')
options=('!strip' 'staticlibs')

source_i686=("https://github.com/AmanoTeam/Loki/releases/download/gcc-${pkgver%%.*}/i386-unknown-linux-gnu.tar.xz")
source_x86_64=("https://github.com/AmanoTeam/Loki/releases/download/gcc-${pkgver%%.*}/x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/AmanoTeam/Loki/releases/download/gcc-${pkgver%%.*}/aarch64-unknown-linux-gnu.tar.xz")
source_armv7h=("https://github.com/AmanoTeam/Loki/releases/download/gcc-${pkgver%%.*}/arm-unknown-linux-gnueabihf.tar.xz")

sha256sums_i686=('e24b2fda972b16826d090bd0728bad51160b2f03ac0272890ee44caadffc7ace')
sha256sums_x86_64=('f3c144fe16e423b38be8b4ba06a5e804f42583e51ee070d6e7905e846d8ed66f')
sha256sums_aarch64=('0baeedec6ef95e9ac6d2e68e4aadeb56df332f50a22423f75ee1f43ad4e800c4')
sha256sums_armv7h=('c0114365cc5dd66222aab5ad0b690703b0a7ab66158f5817ad40883e43b5d360')

__alt_pkgname='loki'

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
		"${pkgdir}/opt/${__alt_pkgname}/bin/"*'-unknown-freebsd-'* \
		"${pkgdir}/usr/bin"
	
}
