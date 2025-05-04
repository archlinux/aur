# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=barcodes.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.0.0
_rockrel=1
pkgrel=1
pkgdesc='Barcodes package for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(GPL-3.0-only)
depends=(sile)
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('d66ff34e32065aafa3438e9915191f67811341d2e0ed5c3b6693b6730bc51368')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
