# Maintainer: wackbyte <im@purring.fyi>

_pkgname=foreman
pkgname=foreman-bin
pkgver=1.6.5
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
b2sums_aarch64=('e7fc278d543b560fb219bd0cfe3e6c9b6b168f5f7d4a088edbd551c13eaac0dd5de199d9fa5780559824cb1a98adff59168f79a5d2a7ac11c477218361e22dc0')
b2sums_x86_64=('a632d82266320401d2e29342aa4e0b693a17907f1d7f7a7b266f55f3a5648a69c6a446ad1580d02fdecd749821f994489fade06382cd44a968e18e94afb4cf0a')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}-${CARCH}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
}
