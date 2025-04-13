# Maintainer: wackbyte <im@purring.fyi>

_pkgname=uiua
pkgname=uiua-bin
pkgver=0.15.1
pkgrel=1
pkgdesc='A stack-based array programming language'
arch=('x86_64')
url='https://www.uiua.org/'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('unzip')
provides=("${_pkgname}=${pkgver}")
conflicts=($_pkgname)
source=("${_pkgname}-${pkgver}.zip::https://github.com/uiua-lang/uiua/releases/download/${pkgver}/uiua-bin-x86_64-unknown-linux-gnu.zip")
b2sums=('5d97ec6595fb949a6af8405d897300bf29c65032f58a920a62436d9fe9b5d08fbd34e6abadde420943fd5dc2d4c2a3764a0c6e8726adfbbf06cb7942a5eac7b8')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
}
