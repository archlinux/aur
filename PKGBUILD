# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=textsubsuper.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.1.0
_rockrel=1
pkgrel=1
pkgdesc='Real or fake superscripts and subscripts for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('da483e48cba7c0cf41d31e9833c52523727f00dc4dce6b88b74cb21377784995')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
