# Maintainer: Sebastien Waegeneire <sebastien@waegeneire.com>

pkgname=oxlint-bin
pkgver=1.42.0
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

sha256sums_x86_64=('287901660d95c86bffb1e18dad95c8766f3edac8016eefeb422f65b09366d351')
sha256sums_aarch64=('d35d969ea4a1953d56880e31edd701bd1ce651586b894ba07218b82e5333e233')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxlint"
}
