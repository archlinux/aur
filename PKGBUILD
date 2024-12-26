# Maintainer: taotieren <admin@taotieren.com>

pkgbase=strmassistant-bin
pkgname=(strmassistant{,lite}-bin)
_name=StrmAssistant
_namel=StrmAssistantLite
pkgver=2.0.0.1
pkgrel=1
epoch=
pkgdesc="Strm Assistant for Emby"
arch=(x86_64)
url="https://github.com/sjtuross/StrmAssistant"
license=('GPL-3.0-or-later')
replaces=()
depends=(emby-server)
makedepends=()
optdepends=("emby-theater: An Electron app for Emby")
backup=()
options=('!strip' '!debug' '!lto')
source=("${_name}-${pkgver}.dll::${url}/releases/download/v${pkgver}/${_name}.dll"
    "${_namel}-${pkgver}.dll::${url}/releases/download/v${pkgver}/${_namel}.dll")
sha256sums=('2a8e4619a688555d9aa82c02932150d1cd9a0c51da5cf950f9345f761721546f'
            'b7343598f45ac842fbea525d6f114ecc8d5198f59d357a54d8c937a5af695b4e')
noextract=()

package_strmassistant-bin() {
    provides=(${pkgname%-bin} ${_name})
    conflicts=(${pkgname%-bin} ${_name})
    install -Dm0644 ${srcdir}/${_name}-${pkgver}.dll "${pkgdir}/usr/lib/emby-server/plugins/${_name}.dll"
}

package_strmassistantlite-bin() {
    pkgdesc+=" - Lite"
    provides=(${pkgname%-bin} ${_namel})
    conflicts=(${pkgname%-bin} ${_namel})
    install -Dm0644 ${srcdir}/${_namel}-${pkgver}.dll "${pkgdir}/usr/lib/emby-server/plugins/${_namel}.dll"
}
