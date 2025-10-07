# Maintainer: Oshgnacknak <osh@oshgnacknak.de>
pkgname=vegalinux64
pkgver=20251007
pkgrel=1
pkgdesc="Chess tournament administration sorfware"
arch=('x86_64')
url="https://www.vegachess.com"
license=('Custom')
depends=('jre-openjdk'
         'libmariadbclient')
makedepends=()
source=("http://www.vegachess.com/download/vegalinux64.tar.gz"
        'vegachess.desktop'
        'vegateam.desktop'
        'logo.png')
noextract=()
sha256sums=('c9f5360d89e8814f37dc11e314acdb2789011489bff65bc3a5cfacfbb15edb84'
            '7ed253af097df983fc1ead3b77cd0ebb443696b32a0c50399d316f31e4b1c51b'
            'e6b762f998a4cf88e7b52a4a7884c58c55cf0939e7077f1d038868a2706115fc'
            'ac0385b28ad27877947913ae486d619f39c495d4e69369066e7e10755247bfc6')

pkgver() {
    date '+%Y%m%d'
}

package() {
    install --directory \
        "${pkgdir}/usr/bin" \
        "${pkgdir}/usr/share/applications" \
        "${pkgdir}/usr/share/vegalinux64"

    cp -v \
        "${srcdir}/vegachess.desktop" \
        "${srcdir}/vegateam.desktop" \
        "${pkgdir}/usr/share/applications"

    cp -v "${srcdir}/logo.png" "${pkgdir}/usr/share/vegalinux64"

    cp -rv "${srcdir}/vegalinux64" "${pkgdir}/usr/share"

    ln -s /usr/share/vegalinux64/Vega "${pkgdir}/usr/bin/Vega"
    ln -s /usr/share/vegalinux64/VegaTeam "${pkgdir}/usr/bin/VegaTeam"
}
