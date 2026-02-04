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

sha256sums_i686=('ea423165035e48cacbc190a7a8480c45e65a8029f6bf6e0e234affe3710996d7')
sha256sums_x86_64=('f1fd65d5351ab57dcba24702413d045bf2db70295ab02c7814b6c04a7a81e090')
sha256sums_aarch64=('70b228dcbceb198c8752f7e16dfd14e661041a382cc19bec36a046bcb8be8dcc')
sha256sums_armv7h=('9ef4581ba04706be3186ca74896aa07972a98ac9aeb0e5edb3c66cc92c671935')

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
