# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=android-gcc-cross-bin
pkgver=15.2.0
pkgrel=20260131
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

sha256sums_i686=('b244ab9c6e690abe77b0685dbb85088ef945d0622a4ccd61e9628b5f4c85e259')
sha256sums_x86_64=('4d338e36998f4695ea0cd72210595a3677dcaba928d61fc0463d5128db76b8f1')
sha256sums_aarch64=('b014ca34578c7c710ba21353f7988cc709a5e727d54a37c5d4ff3558c2ff43dc')
sha256sums_armv7h=('5c6bbaf97c8fc91bb4a1f2387c5866431feb27c6da282e9458cd5f0115031c37')

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

