# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=haiku-gcc-cross-bin
pkgver=15.2.0
pkgrel=20251209
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

sha256sums_i686=('ad468e942f82c2d79879d46db70c18dd328300949a194b1b7305e3b24d01df2b')
sha256sums_x86_64=('ea9b4221854e7d7e91c95236a91c2eaac936c193ed58c8d9ce5ed79ae2af8c31')
sha256sums_aarch64=('4bd18d1ab7ad7cf5e72d7d609627f76c7c4ab2e8834e2ebb584dd507e16b2f90')
sha256sums_armv7h=('ec6ac6b94455b1c7aa12c8bf0606c274eac8273c51fe30486c66faa8e5ed6553')

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
