# Maintainer: Oliver Rümpelein <arch@pheerai.de>; Siegfried Krug <siegfried nospamat fg4f nospamdot de>
pkgname=x32edit
pkgver=3.0
pkgrel=1
pkgdesc="Remote control and programm Behringer X32 consoles"
arch=('i686' 'x86_64')
url="http://www.behringer.com/EN/products/X32.aspx"
license=('custom:MUSIC Group End User License Agreement')
install=x32edit.install
depends_i686=('libxext' 'alsa-lib' 'freetype2' 'mesa' 'mesa-libgl')
depends_x86_64=('lib32-libxext' 'lib32-alsa-lib' 'lib32-freetype2' 'lib32-pcre' 'lib32-mesa' 'lib32-mesa-libgl')
source=("http://downloads.music-group.com/software/behringer/X32/X32-Edit_LINUX_3.0.tar.gz"
"http://www.music-group.com/eurocom/assets/EULA_2012-09-12.pdf")
sha512sums=('14792284c669d2d872df75d7b7de3dba516aa79446691ae9245191caa3d6b92c774dd0d20b5ff7360e9c9c78874f9c28ef8b38db0fc89f2688fb2a879fed27ba'
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
