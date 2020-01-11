# Maintainer: piegames <aur@piegames.de>
pkgname=bit2bitbin
pkgver=0
pkgrel=0
pkgdesc="Convert .bit to .bit.bin file. Use for Zynq U-Boot"
arch=('any')
url="https://github.com/pgielda/zynq_bootloader/tree/master/bit2bitbin"
license=('MIT')
depends=()
makedepends=('gcc')
source=("https://raw.githubusercontent.com/pgielda/zynq_bootloader/b14563c7b7c068551da1e073d164db54239a60ee/bit2bitbin/bit2bitbin.c")
sha512sums=('f80583414927bd7bb8888843bc3fdb537003a62f5669a5418953f94e9e489b590656492b749bb7645829f26b8adc6b921e549663dbf5582266868747dd710a23')

build() {
	cd "$srcdir/"
	gcc bit2bitbin.c -o bit2bitbin
}

package() {
	cd "$srcdir/"
	
	# Install Arch-Linux specific files
	install -Dm755 'bit2bitbin' "$pkgdir/usr/bin/bit2bitbin"
}
