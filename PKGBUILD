# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=android-gcc-cross-bin
pkgver=15.2.0
pkgrel=20251209
pkgdesc='A GCC cross-compiler targeting Android'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/AmanoTeam/Pino'
license=('LGPL-3.0')
depends=()
optdepends=()
provides=('android-gcc-cross')
conflicts=('android-gcc-cross')
options=('!strip' 'staticlibs')

source_i686=("https://github.com/AmanoTeam/Pino/releases/download/gcc-${pkgver%%.*}/i386-unknown-linux-gnu.tar.xz")
source_x86_64=("https://github.com/AmanoTeam/Pino/releases/download/gcc-${pkgver%%.*}/x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/AmanoTeam/Pino/releases/download/gcc-${pkgver%%.*}/aarch64-unknown-linux-gnu.tar.xz")
source_armv7h=("https://github.com/AmanoTeam/Pino/releases/download/gcc-${pkgver%%.*}/arm-unknown-linux-gnueabihf.tar.xz")

sha256sums_i686=('f918342b6df36843b6de6e1a13450206511f1ef45f50f55403d85860c465dee9')
sha256sums_x86_64=('973d38c6d1f5fd5b1d95a7236726c8ec86679d5685d683c9722a68e474815438')
sha256sums_aarch64=('5ffb48f7b73747a6308dff6a0ac3160a7fb256fcfcd6e1274b4643c14dd810b3')
sha256sums_armv7h=('f8628acb27925fb3755169cb1ef2d3bf414f720b59d20311094efe0739f21cb9')

__alt_pkgname='pino'

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
		"${pkgdir}/opt/${__alt_pkgname}/bin/"*'-unknown-linux-android'* \
		"${pkgdir}/usr/bin"
	
	ln \
		--symbolic \
		--relative \
		"${pkgdir}/opt/${__alt_pkgname}/bin/ndk-patch" \
		"${pkgdir}/usr/bin"
	
}

