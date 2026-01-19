# Maintainer: Sebastien Waegeneire <sebastien@waegeneire.com>

pkgname=oxfmt-bin
pkgver=0.26.0
pkgrel=1
pkgdesc="A Prettier-compatible code formatter."
arch=('x86_64' 'aarch64')
url="https://oxc.rs"
license=('MIT')
provides=('oxfmt')
conflicts=('oxfmt')

_github_url="https://github.com/oxc-project/oxc/releases/download/apps_v1.41.0"
_binary_x86_64="oxfmt-linux-x64-gnu"
_binary_aarch64="oxfmt-linux-arm64-gnu"

source_x86_64=("${_binary_x86_64}.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${_binary_aarch64}.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums_x86_64=('a8c2cdb4b290bc2c2f2aff3b0c5142eb46528002065dec5808508a07b81dc10f')
sha256sums_aarch64=('37faa2a74f0019ca33db9f254c9ed88a27491fca7bb9a047a83f432912088bcb')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxfmt"
}
