# Maintainer: Oliver Rümpelein <arch@pheerai.de>; Siegfried Krug <siegfried nospamat fg4f nospamdot de>
pkgname=x32edit
pkgver=3.1
pkgrel=1
pkgdesc="Remote control and programm Behringer X32 consoles"
arch=('i686' 'x86_64')
url="http://www.behringer.com/EN/products/X32.aspx"
license=('custom:MUSIC Group End User License Agreement')
install=x32edit.install
depends_i686=('libxext' 'alsa-lib' 'freetype2' 'mesa' 'mesa-libgl')
depends_x86_64=('lib32-libxext' 'lib32-alsa-lib' 'lib32-freetype2' 'lib32-pcre' 'lib32-mesa' 'lib32-mesa-libgl')
source=("http://downloads.music-group.com/software/behringer/X32/X32-Edit_LINUX_3.1.tar.gz"
"http://www.music-group.com/eurocom/assets/EULA_2012-09-12.pdf")
sha512sums=('6585d34f4043696c078fcbe936cad920a5505fd43fa2954e3c82a02c49f590ae77fb45321c088dc85ff4f27113a782d80c93220575f241abf15d3d3fe19f8142'
            'fe39285768937d82f31844b789d1075de8196495727653595e59f4f1b282f6dbe18a8a8bc51b837f284601dc37c52211d3d494a8636512f5398da31ff3d30284')

package()
{
    cd "${srcdir}"
    tar xf X32-Edit_LINUX_${pkgver}.tar.gz
        mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/licenses/x32edit
        install -m 755 X32-Edit ${pkgdir}/usr/bin/
        install -m 644 EULA_2012-09-12.pdf ${pkgdir}/usr/share/licenses/x32edit/license.pdf
}
