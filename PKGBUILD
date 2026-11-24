# Maintainer: WingsButterfly <butterflywings1848@outlook.com>
pkgname=rtk-noavx-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='CLI proxy that reduces LLM token consumption by 60-90% on common dev commands (baseline x86_64, no-AVX build)'
arch=('x86_64')
url='https://github.com/rtk-ai/rtk'
license=('Apache-2.0' 'LicenseRef-BUSL-1.1')
provides=('rtk')
conflicts=('rtk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wings1848/rtk/releases/download/v1.2.1/rtk-noavx-v1.2.1-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('7ab0a5df595a20e26fcce709b9fb79542c3592ac1939797b21921adc9acdc4df')

package() {
    install -Dm755 rtk -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    if [[ -f LICENSE-ENGINE ]]; then
        install -Dm644 LICENSE-ENGINE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    fi
}
