# Maintainer: Oliver Rümpelein <oli_r nospamat fg4f nospamdot de>; Siegfried Krug <siegfried nospamat fg4f nospamdot de>
pkgname=x32edit
pkgver=2.4
pkgrel=1
pkgdesc="Remote control and programm Behringer X32 consoles"
arch=('i686' 'x86_64')
url="http://www.behringer.com/EN/products/X32.aspx"
license=('custom:MUSIC Group End User License Agreement')
install=${pkgname}.install
depends_i686=('libxext' 'alsa-lib' 'freetype2')
depends_x86_64=('lib32-libxext' 'lib32-alsa-lib' 'lib32-freetype2' 'lib32-pcre')
source=("http://www.behringerdownload.de/X32/X32-EDIT_LINUX_V${pkgver}.tar.gz"
'http://www.behringer.com/assets/EULA_2012-09-12.pdf')
sha512sums=('bc3c69ff68d677e40dd2dbba9d16063a9577e5daca8b3dcccaa7491af4c8a8a4e11c81ca0a0a3c36fd741892a5fea1e0400610018e35bf38a9e59e7bc821c11a'
            'fe39285768937d82f31844b789d1075de8196495727653595e59f4f1b282f6dbe18a8a8bc51b837f284601dc37c52211d3d494a8636512f5398da31ff3d30284')
sha256sums=('58ccb5e24f279a58d68c388ec6a38db64c4b9a978b3694ff1e4f4d6cec7430a0'
            '3321aa0b3e208133094665281a6fc2ca001628858cd1a6388185eac93569fca8')
md5sums=('48c14d2f7763ab66464f47aa31e32271'
         '20cca5d2623f1029e30e45d64438b253')

package()
{
    cd "${srcdir}"
    tar xf X32-EDIT_LINUX_V${pkgver}.tar.gz
	mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/licenses/x32edit
	install -m 755 X32-Edit ${pkgdir}/usr/bin/
	install -m 644 EULA_2012-09-12.pdf ${pkgdir}/usr/share/licenses/x32edit/license.pdf
}

