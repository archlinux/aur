# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>

pkgname=gobi-firmware
pkgver=1
pkgrel=7
pkgdesc="Firmware for gobi 2000 wwan chipset"
arch=('any')
license=('custom')
optdepends=('gobi-loader: for automatic firmare loading')
url="http://www.thinkwiki.org/wiki/Qualcomm_Gobi_2000"
options=("!strip")
source=('https://github.com/jolicloud/linux-firmware/raw/master/gobi/amss.mbn' 'https://github.com/jolicloud/linux-firmware/raw/master/gobi/apps.mbn' 'https://github.com/jolicloud/linux-firmware/raw/master/gobi/UQCN.mbn')
sha256sums=('517cb051988efd47d2f18fda165ad90966ceb4106f9e5214415f4c8835be229c'
            'b33aabf2435b66bc17fefe44b2ab41375b72b2aaeaff27c840a0a21adcfb4fc0'
            'c0af8704d37eba54df3dabee047cc9c27ef4f90d5e907e46c3fa972a2ca82210')

package() {
    install -d -m755 "${pkgdir}/usr/lib/firmware/gobi"
    install -m644 "${srcdir}/amss.mbn" "${pkgdir}/usr/lib/firmware/gobi"
    install -m644 "${srcdir}/apps.mbn" "${pkgdir}/usr/lib/firmware/gobi"
    install -m644 "${srcdir}/UQCN.mbn" "${pkgdir}/usr/lib/firmware/gobi"
}
