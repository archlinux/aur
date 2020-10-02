# Maintainer:  Shakib Hossain <shakib609@gmail.com>

pkgname=openbangla-keyboard-bin
pkgver=2.0.0
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
	'https://github.com/OpenBangla/OpenBangla-Keyboard/releases/download/'$pkgver'/OpenBangla-Keyboard_'$pkgver'-archlinux.pkg.tar.zst'
)
# Checksums
sha256sums=(
	'1a72b4e0327d8a25265ebfe5e6050bb3ad8e50ea2aac180bce62e6019f08eb02'
)
# Some installation information
install="$pkgname.install"

package() {
	# Recursively remove group's write permission before moving to package directory
	chmod -R g-w usr
	mv usr "${pkgdir}"
}
