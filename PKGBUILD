# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=android-gcc-cross-bin
pkgver=15.2.0
pkgrel=20260217
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

sha256sums_i686=('58e601e0dabd8c0858bddfd49e9ba4940850dc59090a05cc32b7a2fc033492b0')
sha256sums_x86_64=('6c627f307d20df582bff2260fbf96155c1d9f9e45937380e9461fcda4db2d87d')
sha256sums_aarch64=('2f0bcbdd222dd8688cf10e4b855037a92dd165b8781d99728f192837ecf4abe5')
sha256sums_armv7h=('876d10f39f4904ebb319d609651ab05b24d465e54496005840c3b897f0f4d5a2')

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

