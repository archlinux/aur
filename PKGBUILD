# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>

_rockname=stdlib
pkgbase=lua-$_rockname
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=41.2.2
_rockrel=1
pkgrel=6
pkgdesc='Library of modules for common programming tasks'
arch=(any)
url="https://github.com/$pkgbase/$pkgbase"
license=(MIT)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
_tag="release-v$pkgver"
_archive="$pkgbase-$_tag"
source=("$_archive.tar.gz::$url/archive/$_tag.tar.gz")
sha256sums=('42ca25ddcde59f608694a3335d24919a4df4cf6f14ea46c75249561a16c84711')

_package_helper() {
	cd "$_archive"
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-stdlib() {
	depends+=(lua)
	_package_helper 5.4
}

package_lua53-stdlib() {
	depends+=(lua53)
	_package_helper 5.3
}

package_lua52-stdlib() {
	depends+=(lua52)
	_package_helper 5.2
}

package_lua51-stdlib() {
	depends+=(lua51)
	_package_helper 5.1
}
