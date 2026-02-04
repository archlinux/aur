# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=netbsd-gcc-cross-bin
pkgver=15.2.0
pkgrel=20260203
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

sha256sums_i686=('13aa47a1ff08a6410160b8f3e534bfb370f16ef68935b582445759f896a4495d')
sha256sums_x86_64=('c01c1a12c855d3cc807a3184d9ef8fbca2ba4e222e17ccc7e62af05a36c8b265')
sha256sums_aarch64=('cd0ace96d56c7b8545bb268fe39aaee50bb4625335515d2f15d43834881fb264')
sha256sums_armv7h=('f35152b336f451ac3f9b233600eed6ff3f1492ecdae8d84431f21c66a5cb459e')

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
