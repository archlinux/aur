# Maintainer: wackbyte <im@purring.fyi>

_pkgname=foreman
pkgname=foreman-bin
pkgver=1.7.1
pkgrel=1
pkgdesc='Toolchain manager for Roblox projects'
arch=('aarch64' 'x86_64')
url='https://github.com/Roblox/foreman'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('unzip')
provides=("${_pkgname}=${pkgver}")
conflicts=($_pkgname)
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/foreman-linux-arm64.zip")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/foreman-linux-x86_64.zip")
b2sums_aarch64=('cfc3b96f46a48ee6e85bc779b894b8aac566025dbbd8ea96276255ad7bd87255f059c2eabb62d6fb4eebebdb41bf1d48329eea9262e04d087c4d78ea99851f51')
b2sums_x86_64=('b4dfd9f86b5b2841895409234f5a2818728ded23a417ab1a859a39fdd2aa7fdd5da18b5a269e1114c030072b35a6c173fe80891e1cfb9325f1a1cbd2c377efe3')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}-${CARCH}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
}
