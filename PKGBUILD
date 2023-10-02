# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=qrcode.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.0.0
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
sha256sums=('ffb49d1be5c5a58887093d0848a73bf642011cb55def99353d3a4b876167c0d6')

package() {
	cd "$_archive"
	luarocks --lua-version="5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
