# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=obggcc-bin
pkgver=15.2.0
pkgrel=20260107
pkgdesc='Linux C/C++ cross-compiler targeting older glibc versions'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/AmanoTeam/obggcc'
license=('LGPL-3.0')
depends=()
optdepends=()
provides=('obggcc')
conflicts=('obggcc')
options=('!strip' 'staticlibs')

source_i686=("https://github.com/AmanoTeam/obggcc/releases/download/gcc-${pkgver%%.*}/i386-unknown-linux-gnu.tar.xz.tar.xz")
source_x86_64=("https://github.com/AmanoTeam/obggcc/releases/download/gcc-${pkgver%%.*}/x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/AmanoTeam/obggcc/releases/download/gcc-${pkgver%%.*}/aarch64-unknown-linux-gnu.tar.xz")
source_armv7h=("https://github.com/AmanoTeam/obggcc/releases/download/gcc-${pkgver%%.*}/arm-unknown-linux-gnueabihf.tar.xz")

sha256sums_i686=('441a86a81e8b7174703d10a9fd487866815d75898083dfedb6e79ca221d852da')
sha256sums_x86_64=('8237336cc7c70ce093d85a93e4ae7d9dffd00c7d78354ed50337529bb099effe')
sha256sums_aarch64=('4043fc9e7690650a46c92f42b1642ba17f9ebde38417ed2895243c758cd2c137')
sha256sums_armv7h=('aa9be0bf4aef25b3c4d4bdfc34497473db38e63f078498e59762f33bb3dd9b82')

package() {
	
	mkdir \
		--parent \
		"${pkgdir}/opt" \
		"${pkgdir}/usr/bin"
	
	cp \
		--recursive \
		"${srcdir}/${pkgname/-bin/}" \
		"${pkgdir}/opt"
	
	ln \
		--symbolic \
		--relative \
		"${pkgdir}/opt/${pkgname/-bin/}/bin/"*'-unknown-linux-gnu'*'2.'* \
		"${pkgdir}/usr/bin"
	
}
