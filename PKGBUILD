# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=android-gcc-cross-bin
pkgver=15.2.0
pkgrel=20260301
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

sha256sums_i686=('25098a1c0649f64e60183520e614e1b14900be3248b07478d90b6f09d5a6f641')
sha256sums_x86_64=('d94fa2e03f40ab473220a9d47566ae7ddaa3f2a2c0be19b419be6a7a7284e503')
sha256sums_aarch64=('4bff12c7479acc98919a97eb880e3a482f3eefd740f355b98b9f93b32dfe3e2e')
sha256sums_armv7h=('a451a6e2f3bb4eb700f879bfd5a0d54210a46580114d212af5239d3a8552ccf4')

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

