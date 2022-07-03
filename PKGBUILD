# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-maya
pkgver=24.4.2226589
pkgrel=1
pkgdesc="RenderMan plugin for Maya"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=24.4.2226589'
         'maya>=2019' 'maya<2024'
         'libffi6')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManForMaya-24.4_2226589-linuxRHEL7_gcc63icc190.x86_64.rpm'
        'RenderMan_for_Maya_24.4.module')
sha256sums=('69f134ecc4d64089b7cd22fc74b2caf23a6df8dd9cffe4c890b91fcd927db601'
            'e25c5654aab1e622a83cf4af841c8dd61ac221b489744e56ddf27055ba3819ca')

package() {
    mv opt $pkgdir/
    install -Dm644 "${srcdir}/RenderMan_for_Maya_24.4.module" "${pkgdir}/opt/pixar/RenderManForMaya-24.4/etc"
}
