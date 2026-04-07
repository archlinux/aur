# Contributor: Sebastien Waegeneire <sebastien@waegeneire.com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=oxlint-bin
pkgver=1.59.0
pkgrel=1
pkgdesc="A high-performance linter for JavaScript and TypeScript built on the Oxc compiler stack"
arch=('x86_64' 'aarch64')
url='https://oxc.rs'
license=('MIT')
provides=('oxlint')
conflicts=('oxlint')

_github_url="https://github.com/oxc-project/oxc/releases/download/apps_v${pkgver}"
_binary_x86_64="oxlint-x86_64-unknown-linux-gnu"
_binary_aarch64="oxlint-aarch64-unknown-linux-gnu"

source_x86_64=("${_binary_x86_64}-$pkgver.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${_binary_aarch64}-$pkgver.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums_x86_64=('0c0ee88acd519acab2deb4b47785986109fc598df19d34ad6b14c50b39243c0c')
sha256sums_aarch64=('cac6e1c9e22eab2f84f2412ac2fd0a3869070f54bd5c13c4a6758dff124f3d1f')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxlint"
}
