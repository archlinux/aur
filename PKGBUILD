# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: Oliver Rümpelein <arch@pheerai.de>; Siegfried Krug <siegfried nospamat fg4f nospamdot de>
# Contributor: Evan Anderson <evananderson@thelinuxman.us>
pkgname=x32edit
pkgver=4.4.1
pkgrel=1
_cdn_id1="6-vOpP2lRkyNSDXgZEUbQA"
_cdn_id2="FyIw4jc3bk60nseai05MBQ"
pkgdesc="Remote control and programm Behringer X32 consoles"
arch=('x86_64')
url="http://www.behringer.com/EN/products/X32.aspx"
license=('custom:musictribe End User License Agreement')
depends=('alsa-lib' 'freetype2' 'mesa-libgl' 'hicolor-icon-theme' 'libcurl-gnutls')
source=("https://cdn.mediavalet.com/aunsw/musictribe/$_cdn_id1/$_cdn_id2/Original/X32-Edit_LINUX_$pkgver.tar.gz"
        "LICENSE"
        "x32edit.desktop"
        "x32edit.png")
sha512sums=('7d5ed5ea0400a63179adb59e701472b78efecd50a5d8c9ffb4ad5df4e9116cf9af35fcd2b856c1d7e899ce923b9fa1822272363969500a180477e5addac8b96f'
            '5f7c2661abb76ec3d6000b0f3865faf36afd8a0b721f64fafd8da58c8d8b0691012d56a712860c9d6c76ed80efaa762373ca85950933bf0ba5873c1e3c451099'
            'dd9abb69c1345ef98ac2cdefd0afe6ce1a46a2482b674421c68af0b6a4dd87ea5ae6e1c490d7a236a17f18a8bbcb30dfae64f41c502b7f15a02189b8029baa17'
            '49507db6cd4a45b4fba977a4c7f2f475cfd8f5a6b7c2336d861ae88c30f16282f3380ef820541460809e8ea318c515c063134307a9a14db84946d2595314d625')

package()
{
    cd "$srcdir"

    strip X32-Edit
    install -Dm755 X32-Edit ${pkgdir}/usr/bin/x32edit
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # freedesktop.org compatibility
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 x32edit.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/x32edit.png
}
