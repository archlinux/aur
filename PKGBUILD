# Maintainer: czyt <czytcn@gmail.com>
pkgname=llmux-bin
pkgver=0.2.17
pkgrel=1
pkgdesc="Multi-provider, multi-account Claude proxy with automatic quota-based rotation"
arch=('x86_64' 'aarch64')
url="https://github.com/2lab-ai/llmux"
license=('MIT')
options=('!debug')
depends=('glibc' 'libgcc')
provides=('llmux')
conflicts=('llmux')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/2lab-ai/llmux/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/2lab-ai/llmux/releases/download/v${pkgver}/llmux-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/2lab-ai/llmux/releases/download/v${pkgver}/llmux-linux-aarch64")
sha256sums=('18c9008778e81e8815589c8cb3c528f19daac96bc531908f180c7a816278cfd1')
sha256sums_x86_64=('24ac1bbd21b66d3491149de84932ed3a941a30fc7ee274b95e4b98679f28ccf9')
sha256sums_aarch64=('617f98aad7b831d107b9065744a7593e913ddd5b78d21b7729b8c545d48b6937')

package() {
    local _src
    case "$CARCH" in
        x86_64) _src="${pkgname}-${pkgver}-x86_64" ;;
        aarch64) _src="${pkgname}-${pkgver}-aarch64" ;;
    esac

    install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/llmux"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
