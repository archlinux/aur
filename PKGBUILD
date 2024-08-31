# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=barcodes.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.2.0
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
sha256sums=('4fbfcd7dc1a9965fbd03e4036a22ee2434f4d925724b88f4c788284162194eb3')

package() {
	cd "$_archive"
	luarocks --lua-version "5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
