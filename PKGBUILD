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

sha256sums_i686=('4fb27b9e9a0dea71b4e63ec6ce372c664fe003e686c8943a50871839d53e1687')
sha256sums_x86_64=('672a35c26d25d0adece787139818237e5a5812970da595617d135be39f5dd963')
sha256sums_aarch64=('7766bf560b7f57888ef2f175a4feda3e1a24e97da45a9eee59377fc827f8aae4')
sha256sums_armv7h=('c85f1e471059f229bb4b866c5a7372188ab8919d709de515b9328e643065d099')

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
