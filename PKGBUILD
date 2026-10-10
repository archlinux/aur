# Maintainer: Oshgnacknak <osh@oshgnacknak.de>
pkgname=vegalinux64
pkgver=12.1.13
pkgrel=1
epoch=2
pkgdesc="Chess tournament administration sorfware"
arch=('x86_64')
url="https://www.vegachess.com"
license=('Custom')
depends=('java-runtime'
         'libmariadbclient')
makedepends=()
source=('vegachess.desktop'
        'vegateam.desktop'
        'logo.png')
sha256sums=('7ed253af097df983fc1ead3b77cd0ebb443696b32a0c50399d316f31e4b1c51b'
            'e6b762f998a4cf88e7b52a4a7884c58c55cf0939e7077f1d038868a2706115fc'
            'ac0385b28ad27877947913ae486d619f39c495d4e69369066e7e10755247bfc6')
sha256sums_x86_64=('f65e5807debb6870c7ab09b90130d5c9e2717a786f550bfc6c3ad41a80ab83a7')
source_x86_64=("vegalinux64-${pkgver}.tar.gz::https://www.vegachess.com/dwn/vegalinux64.tar.gz")
options=('!strip' '!debug')

package() {
  install --directory \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/vegalinux64"

  cp \
    "${srcdir}/vegachess.desktop" \
    "${srcdir}/vegateam.desktop" \
    "${pkgdir}/usr/share/applications"

  cp "${srcdir}/logo.png" "${pkgdir}/usr/share/vegalinux64"

  cp -r "${srcdir}/vegalinux64" "${pkgdir}/usr/share"

  ln -s /usr/share/vegalinux64/Vega "${pkgdir}/usr/bin/Vega"
  ln -s /usr/share/vegalinux64/VegaTeam "${pkgdir}/usr/bin/VegaTeam"
}
