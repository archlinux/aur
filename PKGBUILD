# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-maya
pkgver=26.2.2336968
pkgrel=1
pkgdesc="RenderMan plugin for Maya"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=26.2.2336968'
         'maya>=2024' 'maya<2025'
         'libffi6')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManForMaya-26.2_2336968-linuxRHEL9_gcc11icx232.x86_64.rpm'
        'RenderMan_for_Maya_26.2.module')
b2sums=('5f56848512c49153d45552badc2c3aca55df6f639262e722384b6be841a84a3cd0bc635aea9ef2c9b4bdd8b65f43d1f272971f7591f5c13bc2af4bf2f2370b34'
        '4a4b712eebb305acb3c63b576204436749d28028c7969943a8a658f363cec606c8b6da0cfef3fdd16e8c0f89a51a9c18bb946952ee0defe14d8177c938b9f4be')

package() {
    mv opt "$pkgdir/"
    install -Dm644 "$srcdir/RenderMan_for_Maya_26.2.module" "$pkgdir/opt/pixar/RenderManForMaya-26.2/etc"
}
