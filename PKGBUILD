# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-fluent
pkgver=0.0.4
_rockname=fluent
_rockrel=0
pkgrel=1
pkgdesc="Lua implementation of Project Fluent."
arch=('any')
url="https://github.com/alerque/fluent-lua"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=("lua-fluent-git")
source=("https://raw.githubusercontent.com/alerque/fluent-lua/master/rockspecs/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('89bca939399bdc8358825d3fdef4d05df6defa49027066fb4eaf1b180d9e2f01')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
