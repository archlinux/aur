# Maintainer:  Shakib Hossain <shakib609@gmail.com>

pkgname=openbangla-keyboard-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="An OpenSource, Unicode compliant Bengali Input Method"
arch=('x86_64')
url="https://openbangla.github.io/"
license=('GPL3')
depends=(
	'ibus'
	'qt5-base'
)
makedepends=(
)
optdepends=(
	'ttf-indic-otf: fonts for Bangla and other Indic scripts'
	'ttf-freebanglafont: miscellaneous fonts for Bangla script'
)
conflicts=(
	'openbangla-keyboard'
	'openbangla-keyboard-git'
)
provides=('openbangla-keyboard')

# Sources
source=(
	'https://github.com/OpenBangla/OpenBangla-Keyboard/releases/download/'$pkgver'/OpenBangla-Keyboard_'$pkgver'-archlinux.pkg.tar.xz'
)
# Checksums
sha256sums=(
	'16ab1846cdef21220212c157b5d11e7f8974b7a64b7425fa50595a19217f5b1b'
)
# Some installation information
install="$pkgname.install"

package() {
	# Recursively remove group's write permission before moving to package directory
	chmod -R g-w usr
	mv usr "${pkgdir}"
}
