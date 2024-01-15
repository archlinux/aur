# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=barcodes.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.1.0
_rockrel=1
pkgrel=1
pkgdesc='Barcodes package for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('301f1d667bc33cf07a28265d5c9b0c5b5c5882d65e7aa6376b5e7c832336b6da')

package() {
	cd "$_archive"
	luarocks --lua-version="5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
