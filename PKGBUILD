# Maintainer: Raresh Nistor <raresh@nistor.email>
pkgname=satodriver-bin
pkgver=2.31.0
pkgrel=1
pkgdesc='SATO Cups Driver for Linux'
arch=('x86_64')
url='https://www.satoamerica.com/resources/software/linux-and-mac-os-x-drivers-for-sato-printers'
license=('custom')

makedepends=('unzip' 'tar' 'gzip')
optdepends=('cups: print server')

options=('!strip')

source=('SATOLinuxDriver_x64.zip::https://www.sato-global.com/files/Printer_Drivers/SATO_CUPS_Driver/Linux/SATOLinuxDriver_x64.zip')
sha256sums=('7f5667072fe006f1361dd16df49f02199de07c8b31e9e5de99a0eb8f930f42c7')
noextract=('SATOLinuxDriver_x64.zip')

package() {
	unzip -d zip SATOLinuxDriver_x64.zip
	mkdir src
	tar -xf zip/satodriver-$pkgver-linux-4.15-x86_64.tar.gz -C src
	
	gunzip -ck src/satodriver.sw | tar -xf - -C "$pkgdir/"
	gunzip -ck src/satodriver.ss | tar -xf - -C "$pkgdir/"
}
