# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=netbsd-gcc-cross-bin
pkgver=15.2.0
pkgrel=20251210
pkgdesc='A GCC cross-compiler targeting NetBSD'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/AmanoTeam/Dakini'
license=('LGPL-3.0')
depends=()
optdepends=()
provides=('netbsd-gcc-cross')
conflicts=('netbsd-gcc-cross')
options=('!strip' 'staticlibs')

source_i686=("https://github.com/AmanoTeam/Dakini/releases/download/gcc-${pkgver%%.*}/i386-unknown-linux-gnu.tar.xz")
source_x86_64=("https://github.com/AmanoTeam/Dakini/releases/download/gcc-${pkgver%%.*}/x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/AmanoTeam/Dakini/releases/download/gcc-${pkgver%%.*}/aarch64-unknown-linux-gnu.tar.xz")
source_armv7h=("https://github.com/AmanoTeam/Dakini/releases/download/gcc-${pkgver%%.*}/arm-unknown-linux-gnueabihf.tar.xz")

sha256sums_i686=('2292691cb50b9827b85dc36cb3118ad39b0655983cee6c4aeac0e9f0c7af39b0')
sha256sums_x86_64=('a1a9f2e59a5d55b9157827706839946efbb820a92c5d5c290e20efe677313120')
sha256sums_aarch64=('91923412322748e98bd92f0d82e96fe0dd19259d4b4ba5d7ec694d96ac9603d2')
sha256sums_armv7h=('bdc0287aa15ca9cbe6764491653ff23081aaeaddbaf69c8af76ad47faad60b0c')

__alt_pkgname='dakini'

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
		"${pkgdir}/opt/${__alt_pkgname}/bin/"*'-unknown-netbsd'* \
		"${pkgdir}/usr/bin"
	
}
