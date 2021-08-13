# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=hsluv
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.1
_sha=ff1bcf087b2b352ed5903d6d407b5e394b7a0496
_rockrel=1
pkgrel=1
pkgdesc='Human-friendly HSL'
arch=(any)
url="https://github.com/$_rockname/$_rockname-lua"
license=(MIT)
makedepends=(lua lua53 lua52 lua51 luarocks)
_archive="$_rockname-$pkgver-$_rockrel"
source=("$_archive.tar.gz::$url/archive/$_sha.tar.gz")
sha256sums=('da7369b71df1e5398208dcff328cebc00d9a2546a0515ca9419ae9c85b3a7386')

_package_helper() {
  cd "$_rockname-lua-$_sha"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-hsluv() {
  depends+=(lua)
  _package_helper 5.4
}

package_lua53-hsluv() {
  depends+=(lua53)
  _package_helper 5.3
}

package_lua52-hsluv() {
  depends+=(lua52)
  _package_helper 5.2
}

package_lua51-hsluv() {
  depends+=(lua51)
  _package_helper 5.1
}
