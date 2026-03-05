# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=freebsd-gcc-cross-bin
pkgver=15.2.0
pkgrel=20260304
pkgdesc='A GCC cross-compiler targeting FreeBSD'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/AmanoTeam/Loki'
license=('LGPL-3.0')
depends=()
optdepends=()
provides=('freebsd-gcc-cross')
conflicts=('freebsd-gcc-cross')
options=('!strip' '!debug' '!docs' 'staticlibs')

source_i686=("https://github.com/AmanoTeam/Loki/releases/download/gcc-${pkgver%%.*}/i386-unknown-linux-gnu.tar.xz")
source_x86_64=("https://github.com/AmanoTeam/Loki/releases/download/gcc-${pkgver%%.*}/x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/AmanoTeam/Loki/releases/download/gcc-${pkgver%%.*}/aarch64-unknown-linux-gnu.tar.xz")
source_armv7h=("https://github.com/AmanoTeam/Loki/releases/download/gcc-${pkgver%%.*}/arm-unknown-linux-gnueabihf.tar.xz")

sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')

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
