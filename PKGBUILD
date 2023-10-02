# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=printoptions.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.0.0
_rockrel=1
pkgrel=1
pkgdesc='Image tools for professional printers with the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('011a5acf89e36d06a7d7fff67774b08154bf0719f5bf2dc7aaeb3e67c911e47d')

package() {
	cd "$_archive"
	luarocks --lua-version="5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
