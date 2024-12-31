# Maintainer: taotieren <admin@taotieren.com>

pkgbase=strmassistant-bin
pkgname=(strmassistant{,lite}-bin)
_name=StrmAssistant
_namel=StrmAssistantLite
pkgver=2.0.0.2
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
sha256sums=('aa2115213462fd77d14df7a221cf5e080d8579cb4355ab252d8ff484602e9888'
            '113d7de8516ba93c1240f961c7da7a6edc46d9d9f2b9004238f3bbd9ae7f3312')
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
