# Maintainer: Kartatz <kartatz at amanoteam.com>
pkgname=obggcc-bin
pkgver=15.2.0
pkgrel=20260211
pkgdesc='Linux C/C++ cross-compiler targeting older glibc versions'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/AmanoTeam/obggcc'
license=('LGPL-3.0')
depends=()
optdepends=()
provides=('obggcc')
conflicts=('obggcc')
options=('!strip' 'staticlibs')

source_i686=("https://github.com/AmanoTeam/obggcc/releases/download/gcc-${pkgver%%.*}/i386-unknown-linux-gnu.tar.xz")
source_x86_64=("https://github.com/AmanoTeam/obggcc/releases/download/gcc-${pkgver%%.*}/x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/AmanoTeam/obggcc/releases/download/gcc-${pkgver%%.*}/aarch64-unknown-linux-gnu.tar.xz")
source_armv7h=("https://github.com/AmanoTeam/obggcc/releases/download/gcc-${pkgver%%.*}/arm-unknown-linux-gnueabihf.tar.xz")

sha256sums_i686=('ba9d853e7fe4774461fafeae25033f5a450995e465adcd765134a3354f1b90a7')
sha256sums_x86_64=('57eef3a23fc3c715a385a59e4b71bb29d24fa81b8c91aabd38905b9c680510c5')
sha256sums_aarch64=('e95f91a301a652e942581f36857f5ab5661fa176cf571563d3837d47e817dd2f')
sha256sums_armv7h=('bd29ff29975ec047bf63832eef7f57d06edba332bbf8abf53ac12ce5a4152b59')

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
