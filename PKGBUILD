# Maintainer: wackbyte <im@purring.fyi>

_pkgname=foreman
pkgname=foreman-bin
pkgver=1.7.0
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
b2sums_aarch64=('d6ddeed42a4d63cb0ecc3bba753f899a6d0bc24a13f27393d5ddaf18e9c8d55980becc8b8d008f4b0618535e5e32e0af9ea02ac538659a8810c93e2d8807b69b')
b2sums_x86_64=('13fe321363326fde4feba2d510225a22142f8126136b370d82dd1fb98fbc4ea854d1e1ae74fa102c675d69b1fed5c3d3c4c67c6339936ac1b91611c0a817f22e')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}-${CARCH}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
}
