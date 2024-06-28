# Maintainer: Grant Moyer <dev@grantmoyer.com>
pkgname=xtensa-esp-elf-gdb-bin
pkgver=14.2_20240403
pkgrel=1
pkgdesc='Espressif fork of GDB with support for Xtensa architechture ESP32 family chips'
arch=('x86_64')
url='https://github.com/espressif/binutils-gdb'
license=('GPL-3.0-or-later')
depends=("gdb=${pkgver%_*}")
provides=('xtensa-esp-elf-gdb')
conflicts=('xtensa-esp-elf-gdb')
source=("https://github.com/espressif/binutils-gdb/releases/download/esp-gdb-v$pkgver/xtensa-esp-elf-gdb-$pkgver-x86_64-linux-gnu.tar.gz")
sha256sums=('9d68472d4cba5cf8c2b79d94f86f92c828e76a632bd1e6be5e7706e5b304d36e')

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
