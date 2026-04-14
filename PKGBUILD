# Contributor: Sebastien Waegeneire <sebastien@waegeneire.com>
# Contributor: tee < teeaur at duck dot com >

pkgname=oxfmt-bin
pkgver=0.45.0
oxlint_pkgver=1.60.0
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

sha256sums_x86_64=('95f4058ce2b82e413caf2fbe00055ff7a84770501ad1f81f11763a4ae1836950')
sha256sums_aarch64=('ed08ef658331afcf85065da9f0c5db53ab5b02291cd704b40652c8af14361f34')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxfmt"
}
