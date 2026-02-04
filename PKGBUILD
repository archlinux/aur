# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=haiku-gcc-cross-bin
pkgver=15.2.0
pkgrel=20260204
pkgdesc='A GCC cross-compiler targeting Haiku'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/AmanoTeam/Sil'
license=('LGPL-3.0')
depends=()
optdepends=()
provides=('haiku-gcc-cross')
conflicts=('haiku-gcc-cross')
options=('!strip' 'staticlibs')

source_i686=("https://github.com/AmanoTeam/Sil/releases/download/gcc-${pkgver%%.*}/i386-unknown-linux-gnu.tar.xz")
source_x86_64=("https://github.com/AmanoTeam/Sil/releases/download/gcc-${pkgver%%.*}/x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/AmanoTeam/Sil/releases/download/gcc-${pkgver%%.*}/aarch64-unknown-linux-gnu.tar.xz")
source_armv7h=("https://github.com/AmanoTeam/Sil/releases/download/gcc-${pkgver%%.*}/arm-unknown-linux-gnueabihf.tar.xz")

sha256sums_i686=('8c914dfc32cc0841236ed5c9d404477f2ec8e4a74a0d99df896681f459eccd4d')
sha256sums_x86_64=('7cf509c88269afe1341d8e478a0831301c4c9481cdeb3a9206342157578781cd')
sha256sums_aarch64=('6fe5648a039708f88fa45b0a06b93e08bc63722da8727c349ff3f9aeef010088')
sha256sums_armv7h=('d8b18070585307843c7d7cb538254114951e89737fb50a522a346183f82e26ca')

__alt_pkgname='sil'

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
		"${pkgdir}/opt/${__alt_pkgname}/bin/"*'-unknown-haiku-'* \
		"${pkgdir}/usr/bin"
	
}
