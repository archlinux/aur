# Maintainer: wackbyte <wackbyte@protonmail.com>

_pkgname=foreman
pkgname=foreman-bin
pkgver=1.6.3
pkgrel=1
pkgdesc='Toolchain manager for Roblox projects'
arch=('x86_64')
url='https://github.com/Roblox/foreman'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('unzip')
provides=("${_pkgname}=${pkgver}")
conflicts=($_pkgname)
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/foreman-linux.zip")
b2sums=('aaa669e98915f0c18a85300d7877be6e81107f7f37a9c4f6b177d9ad1d92a25f9f2a7c0be7e7d566b37da851c6d06ac82eb070fafcf2c0ec181a897ab8a596b6')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
}
