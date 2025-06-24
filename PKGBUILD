# Maintainer: wackbyte <im@purring.fyi>

_pkgname=foreman
pkgname=foreman-bin
pkgver=1.6.4
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
b2sums_aarch64=('065c0698ecee67689608cea59892b05487a950605ffb2aaf56cae44ede7732913adb0bf57659f9a2e5731368c1a59d03a6bfb695d76c38903394b850c09888dc')
b2sums_x86_64=('eb7659adb075d79747b492e97e5dc00a71dd3d3b408f257b50036da66bd0bcd769696d2464d1ca79c3213d747c290eeca558b1f60bb12fa5cde87cb87536c532')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}-${CARCH}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
}
