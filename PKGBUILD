# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-maya
pkgver=26.1.2324948
pkgrel=1
pkgdesc="RenderMan plugin for Maya"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=26.1.2324948'
         'maya>=2022' 'maya<2024'
         'libffi6')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManForMaya-26.1_2324948-linuxRHEL7_gcc93icx232.x86_64.rpm'
        'RenderMan_for_Maya_26.1.module')
b2sums=('4b6cbf98ee284a70a4dd988038270eed4f1f2ae1a5e37bf4164fba597b92eaf4b8ba126a37e9c7a7fd89bbe0e66821bb1b0ddaf4dd45c07ba0ac39e73a19b6a3'
        '8c456bdb3269f1d7001d053118a472fbd63f9143ccfd184b8b8df186e616ad357a0b3f0694202a6814eae624c1422a1e8d3a1c7e2a64137b383d017f58f394df')

package() {
    mv opt "$pkgdir/"
    install -Dm644 "$srcdir/RenderMan_for_Maya_26.1.module" "$pkgdir/opt/pixar/RenderManForMaya-26.1/etc"
}
