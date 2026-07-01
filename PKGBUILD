# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=zedis-bin
pkgver=0.4.6
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

b2sums_x86_64=('a9b203ec246c03cb7e0753597f0ed5c87a18cae5103e8ea126beffc88390adabfa951b3a788d76535907265f615078e878fdc89a7e1ccc29fa335092ea48f1d2'
               '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85'
               '6c79e93b9a163f40c497ef444c408b8bbfabafa6cf5169be37f0f29e7d2359bb9a6f1c44b80586fa8bd69591d3a7bb940350dc8424f263203ac2746764511c5c')

# vim:set ts=2 sw=2 et:
