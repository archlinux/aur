# Maintainer: willow <willow@purring.fyi>

_pkgname=foreman
pkgname=foreman-bin
pkgver=1.7.2
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
b2sums_aarch64=('a7868235ed40e7a44c844aebbe12bcef4f49dc6926395d8564b2169ca1e6a56148c035b247fedca0f602d675fe3cc8bb965844ad851e1ee575333203cd458e81')
b2sums_x86_64=('7796d2d0bab22f121b5f6cc046fca2d5e5391a490592c5d9aa3f04d99ecffceb2adc3a1662182880f32474336da014d92925dec61b393f074c3ff36d7931c52f')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}-${CARCH}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
}
