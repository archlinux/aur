# Maintainer: Sebastien Waegeneire <sebastien@waegeneire.com>

pkgname=oxlint-bin
pkgver=1.40.0
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

sha256sums_x86_64=('2b6ff01e4badc7fe742a9886db2f9fc71e7091dea315359dce237b703b10ebd0')
sha256sums_aarch64=('634fc9e2e8e9d2b0b9c9a738312b489d07cdebdb401d0f6bca9eceac0a8599f5')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxlint"
}
