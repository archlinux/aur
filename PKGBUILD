# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=dragonfly-gcc-cross-bin
pkgver=15.2.0
pkgrel=20260203
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

sha256sums_i686=('756cc7b0d19773a47e08febd5828341dee78d4fafc38a14e8795f08ad36402b1')
sha256sums_x86_64=('bf61d2db9ff82395afa6b4138f4841ee522e8daa42bc27c98992f3297706b3b0')
sha256sums_aarch64=('ac4ca5ad856f44dc01bde30602ede216aaf38bc7227f4e46c66b46593ea95b3d')
sha256sums_armv7h=('d38b59f93615266dc559d5b57684117963edd1a41cfdea4997541979f46dfeb9')

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
