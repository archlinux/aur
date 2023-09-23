# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

pkgname=lua52-jwtjitsi
pkgver=2.0
pkgrel=3
pkgdesc='LUA JWT Jitsi'
arch=('any')
url='https://github.com/jitsi/luajwtjitsi'
license=('MIT')
depends=('lua52-cjson' 'lua52-base64' 'lua52-luaossl')
makedepends=('luarocks' 'lua52')
source=("https://github.com/jitsi/luajwtjitsi/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "luajwtjitsi-${pkgver}"
    luarocks make --pack-binary-rock --lua-version="5.2" --deps-mode=none luajwtjitsi*.rockspec
}

package() {
    cd "luajwtjitsi-${pkgver}"
    luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none --no-manifest *.rock
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


sha256sums=('c07f427449e4c2e828547e0d32f92377464206e84ffa5ba5d04d0bb2eb7fbb5d')
