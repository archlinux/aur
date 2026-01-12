# Maintainer: Sebastien Waegeneire <sebastien@waegeneire.com>

pkgname=oxlint-bin
pkgver=1.39.0
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

source_x86_64=("${_binary_x86_64}.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${_binary_aarch64}.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums_x86_64=('1bffe3c07b003e44ff3f4cbfbe977ed425ccb963e892d6026c509ca829ea80c0')
sha256sums_aarch64=('8bdbd3cc2abb22e1333fde2ca766bbbf5339a4ff17a4217f33ff0ff71f50c94b')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxlint"
}
