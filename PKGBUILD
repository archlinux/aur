# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=motomagx-gcc-cross-bin
pkgver=15.2.0
pkgrel=20260302
pkgdesc='A GCC cross-compiler targeting MotoMAGX'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/AmanoTeam/motomagx-gcc-cross'
license=('LGPL-3.0')
depends=()
optdepends=()
provides=('motomagx-gcc-cross')
conflicts=('motomagx-gcc-cross')
options=('!strip' 'staticlibs')

source_i686=("https://github.com/AmanoTeam/motomagx-gcc-cross/releases/download/gcc-${pkgver%%.*}/i386-unknown-linux-gnu.tar.xz")
source_x86_64=("https://github.com/AmanoTeam/motomagx-gcc-cross/releases/download/gcc-${pkgver%%.*}/x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/AmanoTeam/motomagx-gcc-cross/releases/download/gcc-${pkgver%%.*}/aarch64-unknown-linux-gnu.tar.xz")
source_armv7h=("https://github.com/AmanoTeam/motomagx-gcc-cross/releases/download/gcc-${pkgver%%.*}/arm-unknown-linux-gnueabihf.tar.xz")

sha256sums_i686=('6ff06fcd3ebe10e1146bfcfc3e916eaab9c40dc1feb1e5b6c81a6b97004a4c5a')
sha256sums_x86_64=('484b2dfb6f7387fc095ae919899dcbcf9af1a70d1b91afb5d087ac5c2cf7de1b')
sha256sums_aarch64=('9c0a4902db1c09e8e9ec578045534525de1ffd76845e5c7dbc40dbcda12ab289')
sha256sums_armv7h=('f0a9658832e638ac2c091c775dd1ee89c81eec9cc9714525758230dea3e508f7')

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
		"${pkgdir}/opt/${pkgname/-bin/}/bin/"*'-unknown-linux-gnu'* \
		"${pkgdir}/usr/bin"
	
}
