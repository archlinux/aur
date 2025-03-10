# Maintainer: taotieren <admin@taotieren.com>

pkgbase=strmassistant-bin
pkgname=(strmassistant-bin)
_name=StrmAssistant
pkgver=2.0.0.18
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
sha256sums=('cdccdf591017a7d2f572992a55e4455107280e7a2b1b9e619a345bd56e03dfbe')
noextract=()

package() {
    install -Dm0644 ${srcdir}/${_name}-${pkgver}.dll "${pkgdir}/usr/lib/emby-server/plugins/${_name}.dll"
}
