# Maintainer:  Shakib Hossain <shakib609@gmail.com>

pkgname=openbangla-keyboard-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="An OpenSource, Unicode compliant Bengali Input Method"
arch=('x86_64')
url="https://openbangla.github.io/"
license=('GPL3')
depends=(
	'cmake'
	'ibus'
	'jsoncpp'
	'libuv'
	'python2-dbus'
	'python2-gobject'
	'rhash'
	'ttf-freebanglafont'
)
makedepends=(
	
)
optdepends=(
)
conflicts=(
	'openbangla-keyboard'
	'openbangla-keyboard-git'
)
provides=('openbangla-keyboard')
replaces=('openbangla-keyboard')

# Sources
source=(
	'https://github.com/OpenBangla/OpenBangla-Keyboard/releases/download/'$pkgver'/openbangla-keyboard-'$pkgver'-'$pkgrel'-'$CARCH'-archlinux.pkg.tar.xz'
)
# Checksums
sha256sums=(
	'b6dc4f57f58b2184d921a0a1655b3943ce8b6c30301ba0cb2e92f0efda5d0d73'
)
# Some installation information
install="$pkgname.install"

#prepare() {
	## Extract data
#	bsdtar xf openbangla-keyboard-$pkgver-$pkgrel-$CARCH-archlinux.pkg.tar
#}

package() {
	# Recursively remove group's write permission before moving to package directory
	chmod -R g-w usr
	mv usr "${pkgdir}"
}

