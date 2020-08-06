# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Florian Walch <florian+aur@fwalch.com>
# Contributor: Florian Hahn <flo@fhahn.com>

_rockname=messagepack
_project=lua-MessagePack
pkgbase=lua-$_rockname
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.5.2
_rockrel=1
pkgrel=2
pkgdesc='Pure Lua implementation of MessagePack spec v5'
arch=('any')
url="https://framagit.org/fperrad/$_project"
license=('MIT')
checkdepends=('lua' 'lua-testmore')
source=("$pkgbase-$pkgver.tar.bz2::https://framagit.org/fperrad/$_project/-/archive/$pkgver/$_project-$pkgver.tar.bz2")
sha256sums=('f94dbe14bbf72bf4a6d91110353614f01a7300372af3af77f5ba308569a07ab0')

check() {
  cd "$_project-$pkgver"
  make check
}

_package_helper() {
  cd "$_project-$pkgver"
  make LUAVER="$1" PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-messagepack() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-messagepack() {
  depends+=('lua53')
  _package_helper 5.3
}

package_lua52-messagepack() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-messagepack() {
  depends+=('lua51')
  _package_helper 5.1
}

