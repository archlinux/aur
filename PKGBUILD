# Maintainer: Matthew Gamble <git@matthewgamble.net>

_lua_version=5.3

pkgname=lustache
pkgver=1.3.1
_gittag="1.3.1-0"
pkgrel=1
pkgdesc="Mustache templates for lua"
arch=("any")
url="http://olivinelabs.com/lustache/"
license=("custom:MIT")
depends=("lua")
source=("https://github.com/Olivine-Labs/lustache/archive/v${_gittag}.tar.gz")
sha256sums=('540bd5e1f6d32aa44d5be946d1772910fb73b62fa909ca5a026c115ece4170f0')

package() {
    cd "lustache-${_gittag}"
    install -Dm644 "src/lustache.lua" "${pkgdir}/usr/share/lua/${_lua_version}/lustache.lua"
    _files=("context" "renderer" "scanner")
    for _file in ${_files[@]}; do
        install -Dm644 "src/lustache/${_file}.lua" "${pkgdir}/usr/share/lua/${_lua_version}/lustache/${_file}.lua"
    done
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/lustache/LICENSE"
}

