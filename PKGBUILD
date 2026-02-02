# Maintainer: Sebastien Waegeneire <sebastien@waegeneire.com>

pkgname=oxlint-bin
pkgver=1.43.0
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

sha256sums_x86_64=('3536d0d5cb35b4b983366779935175e5c693fe901b882db7e179cbb74d5af5c3')
sha256sums_aarch64=('033a89dd44fc9deaf9dba6125aaf66428b0d2139aa5b68ef07812309b2002f34')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxlint"
}
