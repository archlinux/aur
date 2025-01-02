# Maintainer: taotieren <admin@taotieren.com>

pkgbase=strmassistant-bin
pkgname=(strmassistant{,lite}-bin)
_name=StrmAssistant
_namel=StrmAssistantLite
pkgver=2.0.0.3
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
sha256sums=('61abf9782ea8b386293d8c6712fa709ce3f2a4b27a1f4c5974d201cd29801f96'
            '6041cb073dfbfa4a8a8dd78012393189a57428eec7023aa6e2cdce2f375f726a')
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
