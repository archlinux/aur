# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=zedis-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Zedis: A blazing-fast, native Redis GUI built with Rust and GPUI."
arch=('x86_64')
url="https://github.com/vicanso/zedis"
license=('Apache-2.0')
depends=()
makedepends=()
options=("!debug")

provides=("${pkgname%-bin}")

source_x86_64=(
    "${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/zedis-linux-x86_64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/vicanso/zedis/main/LICENSE"
)

package() {
    install -D -m 0755 "${srcdir}/zedis" "${pkgdir}/usr/bin/zedis"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

b2sums_x86_64=('7e5cdccc22582d0bdeb2e59d06fb88bee219ee30b4d1b3f2e327b18d36d904911ab5ae2fe0f5c101504dcbe4422587840f5e3dc37018332e5b0da992c1bce0a7'
               '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85')

# vim:set ts=2 sw=2 et:
