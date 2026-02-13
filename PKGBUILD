# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=motomagx-gcc-cross-bin
pkgver=15.2.0
pkgrel=20260213
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

sha256sums_i686=('d17bf634d937ab0045d8c757223adc7a28e4458a2b055617610252fa302ff8bf')
sha256sums_x86_64=('fe83b3d444ded19626b6c18b70c49af6dff121a793e5e7820925c10b59da5907')
sha256sums_aarch64=('2ff022e95d79c15254696685dc276259bc337f276e9a56d5b4ffc2f85e51f8ce')
sha256sums_armv7h=('3e9590f7a1e4c43645c2bbbffeb6d3f6805cc43df902e994a5b819f1f9852052')

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
