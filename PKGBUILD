# Maintainer: Ottatop <ottatop1227@gmail.com>

pkgname=(lua-protobuf lua53-protobuf lua52-protobuf lua51-protobuf)
pkgdesc="A Lua module to work with Google protobuf"
pkgver=0.5.2
pkgrel=1
_rockrel=1
arch=(x86_64)
url="https://luarocks.org/modules/xavier-wang/lua-protobuf"
license=("MIT")
makedepends=(lua lua53 lua52 lua51 luarocks)
_rock="$pkgname-$pkgver-$_rockrel.src.rock"
_license="$pkgname/LICENSE"
source=("https://luarocks.org/$_rock")
sha256sums=("98446543cec14ba5153c0a6aac3a14e06f73919f76aabd6f83ba115457dae82f")

_package() {
    pkgdesc="A Lua $1 module to work with Google protobuf"
    luarocks --lua-version "$1" --tree "$pkgdir/usr/" install --deps-mode none --no-manifest $_rock
    install -Dm644 $_license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-protobuf() {
    depends=("lua")
    _package 5.4
}

package_lua53-protobuf() {
    depends=("lua53")
    _package 5.3
}

package_lua52-protobuf() {
    depends=("lua52")
    _package 5.2
}

package_lua51-protobuf() {
    depends=("lua51")
    _package 5.1
}
