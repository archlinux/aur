# Maintainer: taotieren <admin@taotieren.com>

pkgbase=strmassistant-bin
pkgname=(strmassistant{,lite}-bin)
_name=StrmAssistant
_namel=StrmAssistantLite
pkgver=1.0.0.47
pkgrel=1
epoch=
pkgdesc="Strm Assistant for Emby"
arch=(x86_64)
url="https://github.com/sjtuross/StrmAssistant"
license=('MIT')
replaces=()
depends=(emby-server)
makedepends=()
optdepends=("emby-theater: An Electron app for Emby")
backup=()
options=('!strip' '!debug' '!lto')
source=("${_name}-${pkgver}.dll::https://github.com/sjtuross/StrmAssistant/releases/download/v${pkgver}/${_name}.dll"
    "${_namel}-${pkgver}.dll::https://github.com/sjtuross/StrmAssistant/releases/download/v${pkgver}/${_namel}.dll")
sha256sums=('188de56b3e1c0d14281b57503bde7b323ec7573bde33e5ae226ac659557491c9'
            '48762ae02d76ba12ebdbe4315f106f41f228697856eda39456885d7c3693250c')
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
