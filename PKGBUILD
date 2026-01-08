# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=freebsd-gcc-cross-bin
pkgver=15.2.0
pkgrel=20260108
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

sha256sums_i686=('a788be95eb5133e252601d5906f81d78f10bc8294d1ab7afabf7a2011f2c6058')
sha256sums_x86_64=('e49b5534a40c36d7925b0e23cfcf0f6c2fe54da5df8bf4550a4a8363e6e0476b')
sha256sums_aarch64=('5b4cf468809f73a282c37b9983e081208b2fede443e0ffb6a622e1bda38a2b1e')
sha256sums_armv7h=('e529501317bcd078e2f5a31055e888360ae10d6c7e9ec7f441907f6e9cf0cc2a')

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
