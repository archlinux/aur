# Maintainer: taotieren <admin@taotieren.com>

pkgbase=strmassistant-bin
pkgname=(strmassistant{,lite}-bin)
_name=StrmAssistant
_namel=StrmAssistantLite
pkgver=2.0.0.4
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
sha256sums=('88a26f675fe5e29fa0e52d68c65c7cd0d4819821265aba2c5f26b4bd8850313f'
            '347a19668446190223162f02f72612cd81c438121eb49ed4be05d31c3b64976c')
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
