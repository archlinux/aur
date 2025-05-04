# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=textsubsuper.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.0.0
_rockrel=1
pkgrel=1
pkgdesc='Real or fake superscripts and subscripts for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(GPL-3.0-only)
depends=(sile)
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('17a51c6e2049764090d7777132aa965970d593348744e2ba662775bb0a553904')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
