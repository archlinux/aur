# Maintainer: wackbyte <im@purring.fyi>

_pkgname=tarmac
pkgname=tarmac-bin
pkgver=0.8.2
pkgrel=1
pkgdesc='Command line tool to manage Roblox assets'
arch=('x86_64')
url='https://github.com/Roblox/tarmac'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('unzip')
provides=("${_pkgname}=${pkgver}")
conflicts=($_pkgname)
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/tarmac-linux.zip")
b2sums=('f5e3bf516acc3763a65279e0f223ed8a41fdc5b5024f39a5d184db63fbfd739b92593e05c45e152498b717abd172956934e7340be2776e950df5bb7bcad9ef06')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
}
