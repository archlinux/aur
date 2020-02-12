# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: archlinux.info:tdy

_rockname=luaposix
pkgname=lua52-posix
pkgver=34.1.1
pkgrel=1
pkgdesc="Lua 5.2 bindings for POSIX APIs"
arch=('i686' 'x86_64')
url="https://github.com/$_rockname/$_rockname"
license=('MIT')
depends=('lua52')
makedepends=('luarocks')
source=("$_rockname-$pkgver.tar.gz::https://github.com/$_rockname/$_rockname/archive/release-v$pkgver.tar.gz")
sha256sums=('273df2dbd9581a2f22e4265f14d0d759c487c0c9830f94395d7d690474382810')

package() {
    cd "$_rockname-release-v$pkgver"
    luarocks --lua-version=5.2 --tree="$pkgdir/usr/" make --deps-mode=none --no-manifest "$_rockname-$pkgver-1.rockspec"
}
