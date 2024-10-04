# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=couyards.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.0.0
_rockrel=1
pkgrel=2
pkgdesc='Pendant ornaments (culs-de-lampe) for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e17f7cd175f4c7921855a1a84ee6a15dd2cbab8f6e908c2d1d662680cb75c65d')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
