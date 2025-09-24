# Maintainer: wackbyte <im@purring.fyi>

_pkgname=uiua
pkgname=uiua-bin
pkgver=0.17.0
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
b2sums=('365ccc6dd4ee914aa6bde61b45b1d9923c078ad0eeae08ce726fa4b662054b0b4a0045edd60217728158921ad7f60beec12d79f98ee59e2bda8749c5820d80d7')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
}
