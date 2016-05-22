# Maintainer: Oliver Rümpelein <oli_r nospamat fg4f nospamdot de>; Siegfried Krug <siegfried nospamat fg4f nospamdot de>
pkgname=x32edit
pkgver=2.5
pkgrel=2
pkgdesc="Remote control and programm Behringer X32 consoles"
arch=('i686' 'x86_64')
url="http://www.behringer.com/EN/products/X32.aspx"
license=('custom:MUSIC Group End User License Agreement')
install=${pkgname}.install
depends_i686=('libxext' 'alsa-lib' 'freetype2' 'mesa' 'mesa-libgl')
depends_x86_64=('lib32-libxext' 'lib32-alsa-lib' 'lib32-freetype2' 'lib32-pcre' 'lib32-mesa' 'lib32-mesa-libgl')
source=("http://downloads.music-group.com/software/behringer/X32/X32-EDIT_LINUX_V.${pkgver}.tar.gz"
'http://www.music-group.com/eurocom/assets/EULA_2012-09-12.pdf')
md5sums=('2082812fa5132c3fc0e3fb3df6d2726e'
         '20cca5d2623f1029e30e45d64438b253')
sha256sums=('7492c58f0dc030bc2dce325bdfc219b27efa3f2428ad1479adba79c55942cc76'
            '3321aa0b3e208133094665281a6fc2ca001628858cd1a6388185eac93569fca8')
sha512sums=('79003f2129a2a7695aed8dd204d2c1fd7a8d451bef42b87c5c7b3c11cd2e6ee8b85e03ae8b0cca680439681b69a26d99f088a2e6ee0a3bb59b0f208250d75c49'
            'fe39285768937d82f31844b789d1075de8196495727653595e59f4f1b282f6dbe18a8a8bc51b837f284601dc37c52211d3d494a8636512f5398da31ff3d30284')

package()
{
    cd "${srcdir}"
    tar xf X32-EDIT_LINUX_V.${pkgver}.tar.gz
	mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/licenses/x32edit
	install -m 755 X32-Edit ${pkgdir}/usr/bin/
	install -m 644 EULA_2012-09-12.pdf ${pkgdir}/usr/share/licenses/x32edit/license.pdf
}

