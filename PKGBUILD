# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-maya
pkgver=24.3.2208291
pkgrel=1
pkgdesc="RenderMan plugin for Maya"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=24.3.2208291'
         'maya>=2019' 'maya<2023'
         'libffi6')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManForMaya-24.3_2208291-linuxRHEL7_gcc63icc190.x86_64.rpm'
        'RenderMan_for_Maya_24.3.module')
sha256sums=('340f4ea3c79ec94cec59c940d90ee43b887d322bd21a72cd13173aa872f1ccfc'
            'd1dfca29b10576b20f8d49d8837f9fe3c308e0db14d55bf4f3a13caefd4282f8')

package() {
    mv opt $pkgdir/
    install -Dm644 "${srcdir}/RenderMan_for_Maya_24.3.module" "${pkgdir}/opt/pixar/RenderManForMaya-24.3/etc"
}
