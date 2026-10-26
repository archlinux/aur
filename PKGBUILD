# Maintainer: czyt <czytcn@gmail.com>
pkgname=llmux-bin
pkgver=0.2.26
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
sha256sums_x86_64=('2bdbba37606a1948ab19726997cacdaac0e086eca0800841cd08a554ddb1ac68')
sha256sums_aarch64=('653c81e137738ecd1cdd356653034488839ea08c1d1be9c57a136554291de5d1')

package() {
    local _src
    case "$CARCH" in
        x86_64) _src="${pkgname}-${pkgver}-x86_64" ;;
        aarch64) _src="${pkgname}-${pkgver}-aarch64" ;;
    esac

    install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/llmux"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
