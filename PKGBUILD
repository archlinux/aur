# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=zedis-bin
pkgver=0.3.3
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
    "${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/zedis-linux-${CARCH}.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/vicanso/zedis/main/LICENSE"
)

package() {
    install -D -m 0755 "${srcdir}/zedis" "${pkgdir}/usr/bin/zedis"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

b2sums_x86_64=('05cd1230e1e58b0a8a09c97fe9fc2d0a0f7fbfd5542d35efb0faa9291eed36b0129bdf490a06988a0ea6a2b50fff948c089e7fa74e7106fb223b949a5c614d6b'
               '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85')

# vim:set ts=2 sw=2 et:
