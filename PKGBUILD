# Maintainer: Oliver Jaksch <arch-aur _at_ com-in dot de>
# Contributor: Oliver Jaksch <arch-aur _at_ com-in dot de>
# Contributor: Oliver Jaksch <arch-aur _at_ com-in dot de>

pkgname=prog-express
pkgver=3.7.8
pkgrel=2
pkgdesc="Prog-Express is a control software for the Batronix USB programming devices to program FLASH/PROM/EPROM/EEPROM chips"
arch=('i686' 'x86_64')
url="http://www.batronix.com/"
license=('custom:Freeware')
depends=('xz' 'libarchive' 'mono' 'mono-basic' 'libusb' 'sqlite' 'libgdiplus')

source_i686=(${url}/exe/Batronix/Prog-Express/deb/${pkgname}-${pkgver}-${pkgrel}.i386.deb)
source_x86_64=(${url}/exe/Batronix/Prog-Express/deb/${pkgname}-${pkgver}-${pkgrel}.amd64.deb)

sha256sums_i686=('c8c86e565d042db8f7461f2079ce3b33cb90a53c0bb849c8d61bc483885e561a')
sha256sums_x86_64=('ddaa92f23bbd0b08781ea7e39f8c55521e49acbb6db1d6a40087c0777799e95d')

package() {
    cd "$pkgdir"
    tar xf $srcdir/data.tar.xz
    cp -r lib/* usr/lib/
    cp -r usr/sbin/* usr/bin/
    rm -rf lib/ usr/sbin/
}
