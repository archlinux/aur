# Contributor: Sebastien Waegeneire <sebastien@waegeneire.com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=oxfmt-bin
pkgver=0.42.0
oxlint_pkgver=1.57.0
pkgrel=1
pkgdesc="Oxfmt is a high-performance formatter for the JavaScript ecosystem"
arch=('x86_64' 'aarch64')
url='https://oxc.rs'
license=('MIT')
provides=('oxfmt')
conflicts=('oxfmt')

_github_url="https://github.com/oxc-project/oxc/releases/download/apps_v$oxlint_pkgver"
_binary_x86_64="oxfmt-x86_64-unknown-linux-gnu"
_binary_aarch64="oxfmt-aarch64-unknown-linux-gnu"

source_x86_64=("${_binary_x86_64}-$pkgver.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${_binary_aarch64}-$pkgver.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums_x86_64=('436a778eda4cc72d5da1f31b330a6a608cc0a3519481c10af01e1ac92cb053fb')
sha256sums_aarch64=('37521641faa69bf55d6a00a80bf9706549d480d889fa07a9916a3db51f701253')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxfmt"
}
