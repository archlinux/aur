# Maintainer: taotieren <admin@taotieren.com>

pkgbase=strmassistant-bin
pkgname=(strmassistant-bin)
_name=StrmAssistant
pkgver=2.0.0.16
pkgrel=1
epoch=
pkgdesc="Strm Assistant for Emby"
arch=(x86_64)
url="https://github.com/sjtuross/StrmAssistant"
license=('GPL-3.0-or-later')
provides=(${pkgname%-bin} ${_name})
conflicts=(${pkgname%-bin} ${_name})
replaces=()
depends=(emby-server)
makedepends=()
optdepends=("emby-theater: An Electron app for Emby")
backup=()
options=('!strip' '!debug' '!lto')
source=("${_name}-${pkgver}.dll::${url}/releases/download/v${pkgver}/${_name}.dll")
sha256sums=('2881d9b37a0c19e93a665af41d4d82648fbb99d83f790cbbca0976a66fab87bf')
noextract=()

package() {
    install -Dm0644 ${srcdir}/${_name}-${pkgver}.dll "${pkgdir}/usr/lib/emby-server/plugins/${_name}.dll"
}
