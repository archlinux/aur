# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

pkgname=lua52-jwtjitsi
pkgver=2.0
pkgrel=2
pkgdesc='LUA JWT Jitsi'
arch=('any')
url='https://github.com/jitsi/luajwtjitsi'
license=('MIT')
depends=('lua52-cjson' 'lua52-base64' 'lua52-luaossl')
makedepends=('luarocks' 'lua52')
source=("git+https://github.com/jitsi/luajwtjitsi#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "luajwtjitsi"
    luarocks make --pack-binary-rock --lua-version="5.2" --deps-mode=none luajwtjitsi*.rockspec
}

package() {
    cd "luajwtjitsi"
    luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none --no-manifest *.rock
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


