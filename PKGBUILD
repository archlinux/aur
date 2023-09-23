# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

pkgname=lua52-base64
pkgver=1.5.3
pkgrel=2
pkgdesc='LUA JWT Jitsi'
arch=('any')
url='https://github.com/iskolbin/lbase64'
license=('MIT')
makedepends=('luarocks' 'lua52')
source=("https://github.com/iskolbin/lbase64/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "lbase64-${pkgver}"
    luarocks make --pack-binary-rock --lua-version="5.2" --deps-mode=none rockspec/base64-1.5-3.rockspec
}

package() {
    cd "lbase64-${pkgver}"
    luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none --no-manifest *.rock
}


sha256sums=('2c4db293cc6f76ef14bf051afd74fe347e7b39f85e825431e5f786e70ff76bae')
