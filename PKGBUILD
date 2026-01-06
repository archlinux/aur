# Maintainer: Sebastien Waegeneire <sebastien@waegeneire.com>

pkgname=oxlint-bin
pkgver=1.38.0
pkgrel=1
pkgdesc="A high-performance linter for JavaScript and TypeScript built on the Oxc compiler stack."
arch=('x86_64' 'aarch64')
url="https://oxc.rs"
license=('MIT')
provides=('oxlint')
conflicts=('oxlint')

_github_url="https://github.com/oxc-project/oxc/releases/download/apps_v${pkgver}"
_binary_x86_64="oxlint-linux-x64-gnu"
_binary_aarch64="oxlint-linux-arm64-gnu"

source_x86_64=("${pkgname}-${pkgver}-${CARCH}.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${CARCH}.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums_x86_64=('32c11eb02f5373ff04258d777ffd59046605b84533a0cf8932fc80b34cd18982')
sha256sums_aarch64=('1fc88c44c59afbcd6916962a1ccb0738026c68c070dfa8006e9ada16d2b771e6')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxlint"
}
