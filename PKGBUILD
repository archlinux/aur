# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-maya
pkgver=26.3.2352291
pkgrel=1
pkgdesc="RenderMan plugin for Maya"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=26.3.2352291'
         'maya>=2024' 'maya<2026')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManForMaya-26.3_2352291-linuxRHEL9_gcc11icx232.x86_64.rpm'
        'RenderMan_for_Maya_26.3.module')
b2sums=('0c68c5ab604423ecfae791d8e1bf8bb23b537775df1c481fe180daafec5932a4d6513c8f8fedd08537f1c01576b0709dccb595721d185c7fd47913506210b387'
        '14aa770b0ad698be3c2fd692277af46a5225c8bae3f7b28a32f6fc6e7a70fa2808eaaf58edb2e4f8cfada59e45f2fa77008347eddcb6f9f7348011ccef99eb25')

package() {
    mv opt "$pkgdir/"
    install -Dm644 "$srcdir/RenderMan_for_Maya_26.3.module" "$pkgdir/opt/pixar/RenderManForMaya-26.3/etc"
}
