# Maintainer: wackbyte <im@purring.fyi>

_pkgname=uiua
pkgname=uiua-bin
pkgver=0.18.1
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
b2sums=('b5b5dac9e126b0a027ddcd72ea047a4d3873246ae3ebe6da3f8c78b4f1172d56a28aa78478ed5b95dd4927f4cf6790d85e634c1e1d1316ca5198cb6327d81f47')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
}
