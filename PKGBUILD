# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=android-gcc-cross-bin
pkgver=15.2.0
pkgrel=20251130
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

sha256sums_i686=('aa3b49b969157f31c9e91e51f1fcc3478101f7e4b5a55dfa913db8b721a3b53d')
sha256sums_x86_64=('1bdaeaeed8e1f8ab5c55b0ae8754e1d7b1fbca631669f71ceb330ee0c2371d4a')
sha256sums_aarch64=('61a2b8958bb2dc4538a0faafca0250f443267424167814eadc695bd3c1010767')
sha256sums_armv7h=('79e951ee98e48abdb7a8d2323836ecdf6efc39445192a5e2d5ac7445175032e6')

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

