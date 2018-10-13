# Maintainer:  Shakib Hossain <shakib609@gmail.com>

pkgname=openbangla-keyboard-bin
pkgver=1.5.1
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
	'e0c67d8aed1dd7f726c2a82e9378ae8783748629d7025a52901ad74a1279fce5'
)
# Some installation information
install="$pkgname.install"

package() {
	# Recursively remove group's write permission before moving to package directory
	chmod -R g-w usr
	mv usr "${pkgdir}"
}
