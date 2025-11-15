# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-maya
pkgver=27.0.2386582
pkgrel=1
pkgdesc="RenderMan plugin for Maya"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=27.0.2386582'
         'maya>=2024' 'maya<2026')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManForMaya-27.0_2386582-linuxRHEL9_gcc11icx232.x86_64.rpm'
        'RenderMan_for_Maya_27.0.module')
b2sums=('7e04b809b65815affc7298586613445be576dce83330c9459785288908fda7c4456ee5c18974923704203a9bac0b69f30bea84b5211f87cf87ca989b18b2b611'
        '2c84fa6e097051a685d93aec0b98e6b83fd1bba66c782ef973680fe25a9c8360be0c4798c3ea940a15b153a05f867b75d4159962533190aa6d732a6b79d5e9c2')

package() {
    mv opt "$pkgdir/"
    install -Dm644 "$srcdir/RenderMan_for_Maya_27.0.module" "$pkgdir/opt/pixar/RenderManForMaya-27.0/etc"
}
