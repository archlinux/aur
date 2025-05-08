# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=barcodes.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.1.0
_rockrel=1
pkgrel=1
pkgdesc='Barcodes package for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('5b011302774dde556af1d2b46dcfa24d054c13dabe08955d4c66456f52bc6d70')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
