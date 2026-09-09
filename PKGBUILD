# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=zedis-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Zedis: A blazing-fast, native Redis GUI built with Rust and GPUI."
arch=('x86_64')
url="https://github.com/vicanso/zedis"
url_source="https://raw.githubusercontent.com/vicanso/zedis/main"
license=('Apache-2.0')
depends=()
makedepends=()
options=("!debug")

provides=("${pkgname%-bin}")

source_x86_64=(
    "${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/zedis-linux-${CARCH}.tar.gz"
    "LICENSE::${url_source}/LICENSE"
    "zedis.desktop::${url_source}/assets/zedis.desktop"
    "zedis-icon.svg::${url_source}/icons/zedis-icon.svg"
)

prepare() {
    cd ${srcdir}
    echo -e "\n\nVersion=${pkgver}" >> zedis.desktop
}

package() {
    install -D -m 0755 "${srcdir}/zedis" "${pkgdir}/usr/bin/zedis"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 0644 "${srcdir}/zedis.desktop" "${pkgdir}/usr/share/applications/zedis.desktop"
    install -D -m 0644 "${srcdir}/zedis-icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/zedis.svg"
}

b2sums_x86_64=('2463fa22aff23ea1d52ca42dd05ee79b83da4087e60d9a8175c5695d5348487f069afd658c877bc08c17a1ba995165fad9d1db26773049d806e0acc563efb0ec'
               '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85'
               'b52ca9b0fe8b182548305f753f26977f6a4e600b71821bc286b0dab8e205ad0271f5cd8b9d845908b29adeb2ddb391a8d77f41a69ac3ce4c401166967886cd30'
               'ca5077322de36a5c4078f851e96eaee1f66edf630c2a2eaa47be12289d18c3730e8b66ff22556ff464073bb042a6b7a5c0a74bfa7bcc4b5ac077031c979a52ce')

# vim:set ts=2 sw=2 et:
