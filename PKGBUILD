# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=silex.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=0.7.0
_rockrel=1
pkgrel=1
pkgdesc='Extension layer for SILE and resilient'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('3ddc7c17e81d31ddeba290659902e17867f4c9c57a1916802c371502d1ada67b')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
