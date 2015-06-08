# Maintainer: Oliver Rümpelein <oli_r nospamat fg4f nospamdot de>; Siegfried Krug <siegfried nospamat fg4f nospamdot de>
pkgname=x32edit
pkgver=2.3
pkgrel=3
pkgdesc="Remote control and programm Behringer X32 consoles"
arch=('i686' 'x86_64')
url="http://www.behringer.com/EN/products/X32.aspx"
license=('custom:MUSIC Group End User License Agreement')
install=${pkgname}.install
depends_i686=('libxext' 'alsa-lib' 'freetype2')
depends_x86_64=('lib32-libxext' 'lib32-alsa-lib' 'lib32-freetype2' 'lib32-pcre')
source=("http://www.behringerdownload.de/X32/X32-Edit_V${pkgver}_LINUX.tar.gz"
'http://www.behringer.com/assets/EULA_2012-09-12.pdf')
md5sums=('35d978adf7f432a291ebcf7da4ec00ad'
         '20cca5d2623f1029e30e45d64438b253')
sha256sums=('35774f0fe974db50c9dec405be6064d809a7d85fe1eef6d781f7599af77b4e6d'
            '3321aa0b3e208133094665281a6fc2ca001628858cd1a6388185eac93569fca8')
sha512sums=('989ee6baa63b546cef6d65292f141dd4c965de71e02cd75240c948e425545f2e9e86fc826f1fd83bbd35a00ac7a1b67c318d9e5381d7f74c024ab304b3df2037'
            'fe39285768937d82f31844b789d1075de8196495727653595e59f4f1b282f6dbe18a8a8bc51b837f284601dc37c52211d3d494a8636512f5398da31ff3d30284')

package()
{
    cd "${srcdir}"
    tar xf X32-Edit_V${pkgver}_LINUX.tar.gz
	mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/licenses/x32edit
	install -m 755 X32-Edit ${pkgdir}/usr/bin/
	install -m 644 EULA_2012-09-12.pdf ${pkgdir}/usr/share/licenses/x32edit/license.pdf
}

