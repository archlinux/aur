# Maintainer: SolarAquarion <shlomochoina@gmail.com>

pkgname=lua51-luassert
pkgver=1.7.10
pkgrel=2
_rockname=luassert
_rockrel=0
pkgdesc="Assertion library for Lua"
arch=('i686' 'x86_64')
url="https://github.com/Olivine-Labs/luassert"
license=('MIT')
depends=('lua51-say' 'lua' 'lua51-filesystem')
makedepends=('luarocks5.1')
conflicts=()
source=("https://github.com/Olivine-Labs/luassert/archive/v${pkgver}.tar.gz")
sha256sums=('f9f8347727c2a4aa8af30d88a0de0314f04cd681b60430e24f6ec0ed393e12e1')

package() {
  cd "$_rockname-$pkgver"
  luarocks-5.1 --tree="$pkgdir/usr" install --deps-mode=none "${_rockname}-${pkgver}-${_rockrel}.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
