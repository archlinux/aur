# Maintainer: Grant Moyer <dev@grantmoyer.com>
pkgname=xtensa-esp-elf-gdb-bin
pkgver=17.1_20260402
pkgrel=1
pkgdesc='Espressif fork of GDB with support for Xtensa architechture ESP32 family chips'
arch=('x86_64')
url='https://github.com/espressif/binutils-gdb'
license=('GPL-3.0-or-later')
optdepends=("gdb-common=${pkgver%_*}: gdb python components for quality of life features")
provides=('xtensa-esp-elf-gdb')
conflicts=('xtensa-esp-elf-gdb')
source=("https://github.com/espressif/binutils-gdb/releases/download/esp-gdb-v${pkgver}/xtensa-esp-elf-gdb-${pkgver}-x86_64-linux-gnu.tar.gz")
sha256sums=('73bc6c4e50b06dceb60e94b53aded61b7769be3cf563572269d9c8d643db8e95')

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
