# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=zedis-bin
pkgver=0.8.0
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

b2sums_x86_64=('c25d17749b0caa391e659eee22efb554b545622d8c57ce0a2cfe4e17317dcc9c78d3bbfd3398363981245c83c080affb2362136af093ef7ada49c221609c27b7'
               '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85'
               'df057953ae9a5bd31c3d1319e0b42e0933fa4e38d7c25bfe23d5200786b6ded1e788e29e900d5ba097a01ac31fc8bc1fee5fc292da36153a5f4dc718c711789b'
               'ca5077322de36a5c4078f851e96eaee1f66edf630c2a2eaa47be12289d18c3730e8b66ff22556ff464073bb042a6b7a5c0a74bfa7bcc4b5ac077031c979a52ce')

# vim:set ts=2 sw=2 et:
