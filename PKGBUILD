# Maintainer: wackbyte <im@purring.fyi>

_pkgname=asphalt
pkgname=asphalt-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Upload and reference Roblox assets in code'
arch=('x86_64')
url='https://github.com/jackTabsCode/asphalt'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('libarchive')
provides=("${_pkgname}=${pkgver}")
conflicts=($_pkgname)
source=("${_pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/asphalt-x86_64-unknown-linux-gnu.tar.xz")
b2sums=('43e60a705fdfc4e64c79f9526144bb28cf843c32a9f29d9f2f93d9e383bb36bfb4db14d79665439a07e2c88b3d958b1984dacfdd707fbf02089374bc6d33c21a')

prepare() {
    tar -xf "${_pkgname}-${pkgver}.tar.xz"
    mv asphalt-x86_64-unknown-linux-gnu/* .
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
