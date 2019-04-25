# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-lcf
pkgver=5.3
_pkgname=lua_code_formatter
_rockname=${pkgname#lua-}
_rockrel=4
pkgrel=1
pkgdesc='Lua code formatter'
arch=('any')
url="https://github.com/martin-eden/$_pkgname"
license=('GPL')
depends=('lua')
makedepends=('luarocks')
conflicts=('lua51-lcf')
source=("https://luarocks.org/${_rockname}-${pkgver}-${_rockrel}.src.rock")
sha256sums=('0cd4519ac9f8dd1a8af845131e18eda9a71954959c820cc9276c6ecef7d513d4')

package() {
    luarocks --tree="$pkgdir/usr" install --deps-mode=none "${_rockname}-${pkgver}-${_rockrel}.src.rock"
    find "$pkgdir/usr" -name manifest -delete
}
