# Maintainer: Uffe Jakobsen
# Contributor: Oliver Jaksch <arch-aur _at_ com-in dot de>

pkgname=prog-express-beta
_pkgname=prog-express
pkgver=3.9.5
pkgrel=1
pkgdesc="Prog-Express is a control software for the Batronix USB programming devices to program FLASH/PROM/EPROM/EEPROM chips. Playground for upcoming betas."
arch=('i686' 'x86_64')
url="https://www.batronix.com/"
license=('LicenseRef-Freeware')
depends=('xz' 'libarchive' 'mono' 'mono-basic' 'libusb' 'sqlite' 'libgdiplus' 'gtk-sharp-2' 'glibc' 'glib2' 'gtk2')
conflicts=('prog-express')

source_x86_64=(${url}/exe/Batronix/Prog-Express/deb/${_pkgname}-${pkgver}-${pkgrel}.amd64.deb)
#source_i686=(${url}/exe/Batronix/Prog-Express/deb/${_pkgname}-${pkgver}-${pkgrel}.i386.deb)

sha256sums_x86_64=("709ac19fc975a4a447f220476274fd37d0a1492b0135d17751c4d7cbb4f6d3c6")
#sha256sums_i686=("72bb235845d828a48f1cc62054b8b18269cf5e012b724335862d2604f69ec2e2")

package()
{
    cd "${pkgdir}"

    tar xf "${srcdir}/data.tar.xz"
    mv -v usr/sbin/bxfxload usr/bin/
    rmdir -v usr/sbin/
    #cp -r lib/* usr/lib/
    #cp -r usr/sbin/* usr/bin/
    #rm -rf lib/ usr/sbin/

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    cp "${pkgdir}/usr/share/doc/prog-express/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/"
}



# https://gitweb.gentoo.org/repo/gentoo.git/diff/app-misc/prog-express/prog-express-3.8.5.ebuild?id=a55e308443586760f0af3be437f626bd2c54380c
