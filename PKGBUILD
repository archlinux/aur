# Maintainer: Oliver Rümpelein <arch@pheerai.de>; Siegfried Krug <siegfried nospamat fg4f nospamdot de>
# Contributor: Evan Anderson <evananderson@thelinuxman.us>
pkgname=x32edit
pkgver=3.1
pkgrel=3
pkgdesc="Remote control and programm Behringer X32 consoles"
arch=('i686' 'x86_64')
url="http://www.behringer.com/EN/products/X32.aspx"
license=('custom:MUSIC Group End User License Agreement')
depends=('libxext' 'alsa-lib' 'freetype2' 'mesa' 'mesa-libgl' 'hicolor-icon-theme')
install=x32edit.install
source=("http://www.music-group.com/eurocom/assets/EULA_2012-09-12.pdf"
        "x32edit.desktop"
        "x32edit.png")
source_i686=("http://downloads.music-group.com/software/behringer/X32/X32-Edit_LINUX_$pkgver.tar.gz")
source_x86_64=("http://downloads.music-group.com/software/behringer/X32/X32-Edit_LINUX_64bit_$pkgver.tar.gz")
sha512sums=('fe39285768937d82f31844b789d1075de8196495727653595e59f4f1b282f6dbe18a8a8bc51b837f284601dc37c52211d3d494a8636512f5398da31ff3d30284'
            'dd9abb69c1345ef98ac2cdefd0afe6ce1a46a2482b674421c68af0b6a4dd87ea5ae6e1c490d7a236a17f18a8bbcb30dfae64f41c502b7f15a02189b8029baa17'
            '49507db6cd4a45b4fba977a4c7f2f475cfd8f5a6b7c2336d861ae88c30f16282f3380ef820541460809e8ea318c515c063134307a9a14db84946d2595314d625')
sha512sums_i686=('6585d34f4043696c078fcbe936cad920a5505fd43fa2954e3c82a02c49f590ae77fb45321c088dc85ff4f27113a782d80c93220575f241abf15d3d3fe19f8142')
sha512sums_x86_64=('bbbf5541860b7ea5ae65194c19189fb85bad03070bb8cf3de61e4439f0b9f7c6e91073e241e14e52c3eaad2d32d4907f8da0cbbf23963bbecef976d9644496a3')

package()
{
    cd "$srcdir"

    install -Dm755 X32-Edit ${pkgdir}/usr/bin/x32edit
    install -Dm644 EULA_2012-09-12.pdf ${pkgdir}/usr/share/licenses/x32edit/license.pdf

    # freedesktop.org compatibility
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 x32edit.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/x32edit.png
}
