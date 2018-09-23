# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=luacheck
pkgver=0.23.0
pkgrel=3
pkgdesc="A tool for linting and static analysis of Lua code."
arch=('any')
url="https://github.com/mpeterv/luacheck"
license=('MIT')
depends=('lua' 'lua-filesystem' 'lua-argparse')
optdepends=('lua-lanes: for parallel checking')
source=("https://github.com/mpeterv/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('b4edf3a7702519502696d4ac7372ed1bd6a82ded63bf81f2b1d7e9b37711be2b')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/lua/5.3/luacheck/stages"
  find src/luacheck -maxdepth 1 -type f -exec install -Dm644 {} "$pkgdir/usr/share/lua/5.3/luacheck" \;
  find src/luacheck/stages -maxdepth 1 -type f -exec install -Dm644 {} "$pkgdir/usr/share/lua/5.3/luacheck/stages" \;
  install -Dm755 "bin/luacheck.lua" "$pkgdir/usr/bin/luacheck"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
