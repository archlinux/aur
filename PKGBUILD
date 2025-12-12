# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=dragonfly-gcc-cross-bin
pkgver=15.2.0
pkgrel=20251211
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

sha256sums_i686=('5e2a3202fc08ae1a3fdb2952a606d7af23a23d10b2044a03fbc5f4e07ef96ae5')
sha256sums_x86_64=('6e12a77eb561e0ffd95d3f6c19761a18c27a48a027d5271eafdf0b133c9086e2')
sha256sums_aarch64=('2a09662e5be31ce1bacad22006a9c400601842f445c17b2c41210693700168f5')
sha256sums_armv7h=('e278bd414bb12978170130a1741fdad7d94f2e1a0eacc3642a4663df1be8d852')

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
