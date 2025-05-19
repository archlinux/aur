# Maintainer: wackbyte <im@purring.fyi>

_pkgname=uiua
pkgname=uiua-bin
pkgver=0.16.0
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
b2sums=('c6c4c458458f513008be28c1054b862fa132f8390922075aa9ce0ecdc46931b1399bc94529071a6a34cf896940b61bd1cad05a264a3bbc9e43bf08067e62a382')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
}
