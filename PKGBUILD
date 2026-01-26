# Maintainer: Sebastien Waegeneire <sebastien@waegeneire.com>

pkgname=oxfmt-bin
pkgver=0.27.0
pkgrel=1
pkgdesc="A Prettier-compatible code formatter."
arch=('x86_64' 'aarch64')
url="https://oxc.rs"
license=('MIT')
provides=('oxfmt')
conflicts=('oxfmt')

_github_url="https://github.com/oxc-project/oxc/releases/download/apps_v1.42.0"
_binary_x86_64="oxfmt-linux-x64-gnu"
_binary_aarch64="oxfmt-linux-arm64-gnu"

source_x86_64=("${_binary_x86_64}.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${_binary_aarch64}.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums_x86_64=('aca3a26545ad13daf5e2ad3ffdb047f38a74f82691ff8ae1ca2c680d00bf395f')
sha256sums_aarch64=('fe905b7678a6d77c0947ebd0d6f5bc4f5509c0ec480bf1512493ffb99b301ebb')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxfmt"
}
