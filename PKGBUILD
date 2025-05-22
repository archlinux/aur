# Maintainer: taotieren <admin@taotieren.com>

pkgbase=strmassistant-bin
pkgname=(strmassistant-bin)
_name=StrmAssistant
pkgver=2.0.0.27
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
sha256sums=('5f93a3b241dce5756aa7c8b065f9e26580fd7eea528f8daa7bab79277dd96d3b')
noextract=()

package() {
    install -Dm0644 ${srcdir}/${_name}-${pkgver}.dll "${pkgdir}/usr/lib/emby-server/plugins/${_name}.dll"
}
