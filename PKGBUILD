# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-maya
pkgver=24.2.2199188
pkgrel=1
pkgdesc="RenderMan plugin for Maya"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman=24.2.2199188' 'renderman-pro-server=24.2.2199188'
         'maya>=2019' 'maya<2023'
         'libffi6')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManForMaya-24.2_2199188-linuxRHEL7_gcc63icc190.x86_64.rpm'
        'RenderMan_for_Maya_24.2.module')
sha256sums=('7436ef13e86e99198c46b236a897ab42d9e349234153fc4fd8edf1a7ec90ff55'
            'f140edf06e7c4708b774185bd581b5d06f35cf5b1e8808331b291bae9045d45d')

package() {
    mv opt $pkgdir/
    install -Dm644 "${srcdir}/RenderMan_for_Maya_24.2.module" "${pkgdir}/opt/pixar/RenderManForMaya-24.2/etc"
}
