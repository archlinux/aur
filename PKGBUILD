# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=zedis-bin
pkgver=0.4.4
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
)

package() {
    install -D -m 0755 "${srcdir}/zedis" "${pkgdir}/usr/bin/zedis"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 0644 "${srcdir}/zedis.desktop" "${pkgdir}/usr/share/applications/zedis.desktop"
}

b2sums_x86_64=('6ce0a92415f104f7ee7b49b87b1fa258bf9c8dd01a5ce6d18457bab774429fc08abb2ce563df6b697ecb00f25d11f4643651e312235f9f421a4aa82b18b62dba'
               '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85'
               '6c79e93b9a163f40c497ef444c408b8bbfabafa6cf5169be37f0f29e7d2359bb9a6f1c44b80586fa8bd69591d3a7bb940350dc8424f263203ac2746764511c5c')

# vim:set ts=2 sw=2 et:
