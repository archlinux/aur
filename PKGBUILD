# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=dragonfly-gcc-cross-bin
pkgver=15.2.0
pkgrel=20251210
pkgdesc='A GCC cross-compiler targeting DragonFly BSD'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/AmanoTeam/Venti'
license=('LGPL-3.0')
depends=()
optdepends=()
provides=('dragonfly-gcc-cross')
conflicts=('dragonfly-gcc-cross')
options=('!strip' 'staticlibs')

source_i686=("https://github.com/AmanoTeam/Venti/releases/download/gcc-${pkgver%%.*}/i386-unknown-linux-gnu.tar.xz")
source_x86_64=("https://github.com/AmanoTeam/Venti/releases/download/gcc-${pkgver%%.*}/x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/AmanoTeam/Venti/releases/download/gcc-${pkgver%%.*}/aarch64-unknown-linux-gnu.tar.xz")
source_armv7h=("https://github.com/AmanoTeam/Venti/releases/download/gcc-${pkgver%%.*}/arm-unknown-linux-gnueabihf.tar.xz")

sha256sums_i686=('d660367ca335e6e8fe2cbf34f6a94f6ae889b73a548cdd86ebd11d4db59f143a')
sha256sums_x86_64=('e6d110774a17208c9bd5ee9d21b2ec08c27875e476d689363fba3a360b10a385')
sha256sums_aarch64=('5259dac895473c2ce85e3a2013d4e04e4f3f4c945b897e648b95d27416f23c85')
sha256sums_armv7h=('c2b93716f12cc01cda9333479fe0174b6a5069bd6df23ecf1dfbbc244c37352e')

__alt_pkgname='venti'

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
		"${pkgdir}/opt/${__alt_pkgname}/bin/"*'-unknown-dragonfly-'* \
		"${pkgdir}/usr/bin"
	
}
