# Maintainer: Sebastien Waegeneire <sebastien@waegeneire.com>

pkgname=oxfmt-bin
pkgver=0.28.0
pkgrel=1
pkgdesc="A Prettier-compatible code formatter."
arch=('x86_64' 'aarch64')
url="https://oxc.rs"
license=('MIT')
provides=('oxfmt')
conflicts=('oxfmt')

_github_url="https://github.com/oxc-project/oxc/releases/download/apps_v1.43.0"
_binary_x86_64="oxfmt-linux-x64-gnu"
_binary_aarch64="oxfmt-linux-arm64-gnu"

source_x86_64=("${_binary_x86_64}.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${_binary_aarch64}.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums_x86_64=('ce8e1609b12e65c1461e3ba4b73702f4c2344c9849652f94a83efc291920a84c')
sha256sums_aarch64=('edea7cbb968e6a68f47a73e8a073829cec0d4f0f1dab6dda4a88a8dfeb3751dd')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxfmt"
}
