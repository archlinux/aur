# Maintainer: Gabriel Fagundez <gabrielfagundeznievas@gmail.com>
# Contributor: Gentleman Programming <info@gentlemanprogramming.dev>

pkgname=gentle-ai
pkgver=1.4.0
pkgrel=1
pkgdesc="AI Gentle Stack - Ecosystem configurator for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Gentleman-Programming/gentle-ai"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
source_x86_64=("${pkgname}_${pkgver}_linux_amd64.tar.gz::https://github.com/Gentleman-Programming/gentle-ai/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}_${pkgver}_linux_arm64.tar.gz::https://github.com/Gentleman-Programming/gentle-ai/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7480579ea4172c755a08e6a45a1cd13dacad64208f74f2a3e9acafb771b7d996')
sha256sums_aarch64=('f7d7c703ad484107f7cd08b3b287215a0a6a1e077befcdcfb1e6f1478030c476')

package() {
    # Install binary
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    
    # Install man page if exists
    if [ -f "${pkgname}.1" ]; then
        install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    fi
}
