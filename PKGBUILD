# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-maya
pkgver=26.0.2323370
pkgrel=1
pkgdesc="RenderMan plugin for Maya"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=26.0.2323370'
         'maya>=2022' 'maya<2025'
         'libffi6')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManForMaya-26.0_2323370-linuxRHEL7_gcc93icx232.x86_64.rpm'
        'RenderMan_for_Maya_26.0.module')
b2sums=('daa911e8f2a51db15c48b6f22e8990866063c4dbd338fffeaed1f9f6c62b886f7b7ce35988261f1ac9e686e3d8aeb6e9ae52cdfebdefd1eda1e2f2a14a4ad725'
        '09c99138b5759ec120fadadecbc9198d82215bc43ab22eca166caca3ce2c16fc706506a786442415ea7f9fb322303fb7c9d8c7c87dc843b5f76f251ed83948ff')

package() {
    mv opt "$pkgdir/"
    install -Dm644 "$srcdir/RenderMan_for_Maya_26.0.module" "$pkgdir/opt/pixar/RenderManForMaya-26.0/etc"
}
