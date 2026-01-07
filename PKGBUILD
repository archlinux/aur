# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=netbsd-gcc-cross-bin
pkgver=15.2.0
pkgrel=20260107
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

sha256sums_i686=('6f33fbbb4deba7aaccc71c40451163646061f7722d3312ef0ded16004fb9ed76')
sha256sums_x86_64=('d769aa424fa038b952919682af6db515090604bcda2942b529ef401ace648363')
sha256sums_aarch64=('07e3d0033058ff1066aafaee9f43e4e4dfb6a4615691642876aa4510362d8fa6')
sha256sums_armv7h=('9f2baad67ed9478544098de4d38a5700c893c51e8d1a77afa3c94528d2b1c07a')

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
