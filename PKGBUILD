# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

pkgname=lua52-base64
pkgver=1.5.3
pkgrel=1
pkgdesc='LUA JWT Jitsi'
arch=('any')
url='https://github.com/iskolbin/lbase64'
license=('MIT')
makedepends=('luarocks' 'lua52')
source=("git+https://github.com/iskolbin/lbase64#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "lbase64"
    luarocks make --pack-binary-rock --lua-version="5.2" --deps-mode=none rockspec/base64-1.5-3.rockspec
}

package() {
    cd "lbase64"
    luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none --no-manifest *.rock
}


