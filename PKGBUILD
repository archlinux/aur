# Maintainer: wackbyte <im@purring.fyi>

_pkgname=uiua
pkgname=uiua-bin
pkgver=0.19.1
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
b2sums=('7613fe0da3301c59c2add43815c2bb7b583d69993feb40a55f1f549abeb7db09e52bde4609cc1097810880cc5f2e16924a1d10aa4c679380e9fd06ed597a88e1')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
}
