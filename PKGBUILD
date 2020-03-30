# Maintainer: Tomas Krizek <tomas.krizek@mailbox.org>

pkgname=('lua-curl' 'lua51-curl' 'lua52-curl')
_pkgname=Lua-cURL
pkgver=0.3.11
pkgrel=1
arch=('x86_64')
url='https://github.com/Lua-cURL/Lua-cURLv3'
license=('MIT')
depends=('curl')
makedepends=('lua' 'lua51' 'lua52')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}v3/archive/v${pkgver}.tar.gz")
sha256sums=('5453d333d09cd731c15270e9dfa2010a595112382a9f48ae5d34c2cd25ff2fae')

package_lua-curl() {
    pkgdesc="Lua 5.3 binding to libcurl"

    cd "${_pkgname}v3-${pkgver}"
    make clean
    make DESTDIR="${pkgdir}/" LUA_IMPL=lua install
}

package_lua51-curl() {
    pkgdesc="Lua 5.1 binding to libcurl"

    cd "${_pkgname}v3-${pkgver}"
    make clean
    make DESTDIR="${pkgdir}/" LUA_IMPL=lua51 install
}

package_lua52-curl() {
    pkgdesc="Lua 5.2 binding to libcurl"

    cd "${_pkgname}v3-${pkgver}"
    make clean
    make DESTDIR="${pkgdir}/" LUA_IMPL=lua52 install
}
