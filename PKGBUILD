# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=luacheck
pkgver=0.17.1
pkgrel=1
pkgdesc="A tool for linting and static analysis of Lua code."
arch=('any')
url="https://github.com/mpeterv/luacheck"
license=('MIT')
depends=('lua' 'lua-filesystem' 'sh')
source=("https://github.com/mpeterv/$pkgname/archive/$pkgver.tar.gz"
        "luacheck")
sha256sums=('454db088f87362697fb6a51976feefcc09f4a4baccefcb3d51edfe31e58f4e23'
            'fefc290dbea67b126b2fbdc0ae08f990b6561ec97f0c86bb53fbdd5cb27de201')

package() {
  cd "$pkgname-$pkgver"

  lua install.lua "$pkgdir/usr/share/lua/5.3/luacheck"

  install -Dm755 "$srcdir/luacheck" "$pkgdir/usr/bin/luacheck"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
