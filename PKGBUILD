# Maintainer: Oliver Jaksch <arch-aur _at_ com-in dot de>
# Contributor: Oliver Jaksch <arch-aur _at_ com-in dot de>
# Contributor: Oliver Jaksch <arch-aur _at_ com-in dot de>

pkgname=prog-express-beta
pkgver=3.8.8
pkgrel=1
pkgdesc="Prog-Express is a control software for the Batronix USB programming devices to program FLASH/PROM/EPROM/EEPROM chips. Playground for upcoming betas."
arch=('i686' 'x86_64')
url="http://www.batronix.com/"
license=('custom:Freeware')
depends=('xz' 'libarchive' 'mono' 'mono-basic' 'libusb' 'sqlite' 'libgdiplus' 'gtk-sharp-2')
conflicts=('prog-express')

source_i686=(${url}/exe/Batronix/Prog-Express/deb/${pkgname%-beta}-${pkgver}-${pkgrel}.i386.deb)
source_x86_64=(${url}/exe/Batronix/Prog-Express/deb/${pkgname%-beta}-${pkgver}-${pkgrel}.amd64.deb)

sha256sums_i686=('4d5ef0f740999ed9704177fb4ca830da7c172f96682506cb659ea191e37d0cb4')
sha256sums_x86_64=('745aa73ee51fbd7ceda91e32cdfe95c9f51b8d852e91dd695ee34a55c70ab645')

package() {
    cd "$pkgdir"
    tar xf $srcdir/data.tar.xz
    cp -r lib/* usr/lib/
    cp -r usr/sbin/* usr/bin/
    rm -rf lib/ usr/sbin/
}



# https://gitweb.gentoo.org/repo/gentoo.git/diff/app-misc/prog-express/prog-express-3.8.5.ebuild?id=a55e308443586760f0af3be437f626bd2c54380c
