# Maintainer: Aanok <aanok.aur@gmail.com>
pkgname=lua-html-entities-git
pkgver=1.3.0.r2.880a6bd
pkgrel=1
pkgdesc="Module for Lua, decoding html entities"
arch=('x86_64')
url="https://github.com/TiagoDanin/htmlEntities-for-lua"
license=('MIT')
depends=('lua')
makedepends=('git')
provides=("${pkgname%-git}")
source=('git+https://github.com/TiagoDanin/htmlEntities-for-lua.git')
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/htmlEntities-for-lua"

	# Git, unannotated tags available
	printf "%s" "$(git describe --long --tags | sed 's/v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}
package() {
  cd "$srcdir/htmlEntities-for-lua"
  
  install -D -m644 "src/htmlEntities.lua" "${pkgdir}/usr/share/lua/5.3/htmlEntities.lua"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE.md"
}