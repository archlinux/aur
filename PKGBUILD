# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-maya
pkgver=25.2.2282810
pkgrel=1
pkgdesc="RenderMan plugin for Maya"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=25.2.2282810'
         'maya>=2020' 'maya<2024'
         'libffi6')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManForMaya-25.2_2282810-linuxRHEL7_gcc93icc219.x86_64.rpm'
        'RenderMan_for_Maya_25.2.module')
sha256sums=('f49f4f3b11335b5a9bdff8a9254e6897fc48dcb8186e5dc62a0304490aeee0b2'
            'aae4ef8a54db7d53dc3de3cd100057561015ffd9280a95f5d762fd5e41530822')

package() {
    mv opt "$pkgdir/"
    install -Dm644 "$srcdir/RenderMan_for_Maya_25.2.module" "$pkgdir/opt/pixar/RenderManForMaya-25.2/etc"
}
