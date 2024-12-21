# Maintainer: wackbyte <wackbyte@protonmail.com>

_pkgname=uiua
pkgname=uiua-bin
pkgver=0.14.0
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
b2sums=('ef1105e2f508218337c8b6e899ed8cf08ce5a41208edca9e6f1718f3a5ddbbbf181a4f3d1c14daed660b0bf8a0f590f3915c24a0d9a9e063713832ba2c5c066b')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" uiua
}
