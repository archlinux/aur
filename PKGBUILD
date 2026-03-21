# Maintainer: Grant Moyer <dev@grantmoyer.com>
pkgname=xtensa-esp-elf-gdb-bin
pkgver=16.3_20250913
pkgrel=1
pkgdesc='Espressif fork of GDB with support for Xtensa architechture ESP32 family chips'
arch=('x86_64')
url='https://github.com/espressif/binutils-gdb'
license=('GPL-3.0-or-later')
optdepends=("gdb-common=${pkgver%_*}: gdb python components for quality of life features")
provides=('xtensa-esp-elf-gdb')
conflicts=('xtensa-esp-elf-gdb')
source=("https://github.com/espressif/binutils-gdb/releases/download/esp-gdb-v${pkgver}/xtensa-esp-elf-gdb-${pkgver}-x86_64-linux-gnu.tar.gz")
sha256sums=('16d05c9104ff84529ac3799abb04d5666c193131ab461f153040721728b48730')

package() {
	# only package files not provided by native GDB
	install -m755 -d "$pkgdir/usr/share"
	cp -r \
		"xtensa-esp-elf-gdb/bin" \
		"xtensa-esp-elf-gdb/lib" \
		"$pkgdir/usr"
	cp -r \
		"xtensa-esp-elf-gdb/share/man" \
		"$pkgdir/usr/share"
}
