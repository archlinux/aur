pkgname=("lua-mqtt" "lua51-mqtt" "lua52-mqtt" "lua53-mqtt")
pkgver=3.4.3
_rockrel=1
pkgrel=1
pkgdesc='MQTT client library for Lua'
arch=(any)
url="https://github.com/xHasKx/luamqtt"
license=(MIT)
_luadeps=()
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
_archive="luamqtt-$pkgver"
source=("luamqtt-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d3b0dd32fa476d07b9fe0635ecbe51e5eab7c50cf1083dcbda7abb92ecc89df3')

_package() {
cd "$_archive"
depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
         make --deps-mode=none --no-manifest "luamqtt-$pkgver-$_rockrel.rockspec"
}

package_lua-mqtt() {
_package 5.4
}

package_lua51-mqtt() {
_package 5.1
}

package_lua52-mqtt() {
_package 5.2
}

package_lua53-mqtt() {
_package 5.3
}
