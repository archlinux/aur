# Maintainer: wackbyte <wackbyte@protonmail.com>

_pkgname=uiua
pkgname=uiua-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='A stack-based array programming language'
arch=('x86_64')
url='https://www.uiua.org/'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('unzip')
provides=("uiua=${pkgver}")
conflicts=('uiua')
source=("${_pkgname}-${pkgver}.zip::https://github.com/uiua-lang/uiua/releases/download/${pkgver}/uiua-bin-x86_64-unknown-linux-gnu.zip")
b2sums=('cadd9d411df8f2cdf1e74291b3edf3065948614361c0391dbf6f5a1a073b10e2c248208c0989c6563a03c252891a01f445151a8659ef424fc0a71db2686cbc2d')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" uiua
}
