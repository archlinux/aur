# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=smartquotes.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.0.0
_rockrel=1
pkgrel=1
pkgdesc='Typographic quotation marks with the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('6d7409a0f063385e3c0c930393e0469b0ddab67ac9e5dffa5303afad6d7388d0')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
