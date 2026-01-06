# Maintainer: Sebastien Waegeneire <sebastien@waegeneire.com>

pkgname=oxfmt-bin
pkgver=0.23.0
pkgrel=1
pkgdesc="A Prettier-compatible code formatter."
arch=('x86_64' 'aarch64')
url="https://oxc.rs"
license=('MIT')
provides=('oxfmt')
conflicts=('oxfmt')

_github_url="https://github.com/oxc-project/oxc/releases/download/apps_v1.38.0"
_binary_x86_64="oxfmt-linux-x64-gnu"
_binary_aarch64="oxfmt-linux-arm64-gnu"

source_x86_64=("${pkgname}-${pkgver}-${CARCH}.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${CARCH}.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums_x86_64=('9274a8a2c2fb551cc5f6a8af4821652c4a8d853745b1f87cf287bf273037e048')
sha256sums_aarch64=('25eb3ebbc1523923b76b5da877982150e6b38cfa69a7d29a8409a4b6b2dd6390')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxfmt"
}
