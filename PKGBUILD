# Maintainer: Sebastien Waegeneire <sebastien@waegeneire.com>

pkgname=oxfmt-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="A Prettier-compatible code formatter."
arch=('x86_64' 'aarch64')
url="https://oxc.rs"
license=('MIT')
provides=('oxfmt')
conflicts=('oxfmt')

_github_url="https://github.com/oxc-project/oxc/releases/download/apps_v1.39.0"
_binary_x86_64="oxfmt-linux-x64-gnu"
_binary_aarch64="oxfmt-linux-arm64-gnu"

source_x86_64=("${_binary_x86_64}.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${_binary_aarch64}.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums_x86_64=('6094fd61e9d823ebee4384f23e9a5944c3633e44d98b52fe10dcc59fa45fd442')
sha256sums_aarch64=('fa1c685400e3b7f503d5702fe31d9e6cf49559d94ee32bd09326d6a3be9860e9')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxfmt"
}
