# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-maya
pkgver=27.1.2389102
pkgrel=1
pkgdesc="RenderMan plugin for Maya"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=27.1.2389102'
         'maya>=2024' 'maya<2027')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManForMaya-27.1_2389102-linuxRHEL9_gcc11icx232.x86_64.rpm'
        'RenderMan_for_Maya_27.1.module')
b2sums=('689241131a823129fd2cc2c36f1085447f052252cab27ff7750e1bf23c6f61a7146c43514af11253b321ed4f9d94552c0ba7be1046a866dc6370ccf85acbec52'
        '1cdbcfe61a58f4a246c48ffbcc88941052e74c22438bb82fbcf1aee06b001041d4ad04fb49625177e494e0d315195704dcc87fd224fc4989496512989705e977')

package() {
    mv opt "$pkgdir/"
    install -Dm644 "$srcdir/RenderMan_for_Maya_27.1.module" "$pkgdir/opt/pixar/RenderManForMaya-27.1/etc"
}
