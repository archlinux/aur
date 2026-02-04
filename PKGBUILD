# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=freebsd-gcc-cross-bin
pkgver=15.2.0
pkgrel=20260203
pkgdesc='A GCC cross-compiler targeting FreeBSD'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/AmanoTeam/Loki'
license=('LGPL-3.0')
depends=()
optdepends=()
provides=('freebsd-gcc-cross')
conflicts=('freebsd-gcc-cross')
options=('!strip' 'staticlibs')

source_i686=("https://github.com/AmanoTeam/Loki/releases/download/gcc-${pkgver%%.*}/i386-unknown-linux-gnu.tar.xz")
source_x86_64=("https://github.com/AmanoTeam/Loki/releases/download/gcc-${pkgver%%.*}/x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/AmanoTeam/Loki/releases/download/gcc-${pkgver%%.*}/aarch64-unknown-linux-gnu.tar.xz")
source_armv7h=("https://github.com/AmanoTeam/Loki/releases/download/gcc-${pkgver%%.*}/arm-unknown-linux-gnueabihf.tar.xz")

sha256sums_i686=('58f6c4fef90523bff631369bd5ecd3fe0903ba95e25b2a299b08c697d6b57b95')
sha256sums_x86_64=('1f8c555a0bfc48ffd67e87238f7acb064d8d72c8d46346447e5f37733ff95828')
sha256sums_aarch64=('0f8186666804e6f55ca8ec2b4ec41b6ba1e2c305b11b53f2673236cab8e6f4ac')
sha256sums_armv7h=('e5395819abec2fec41359165fcf5f2208a101a27d68e3cbc31d5f51a06ff4423')

__alt_pkgname='loki'

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
		"${pkgdir}/opt/${__alt_pkgname}/bin/"*'-unknown-freebsd-'* \
		"${pkgdir}/usr/bin"
	
}
