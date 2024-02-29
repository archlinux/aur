# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=silex.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=0.5.0
_rockrel=1
pkgrel=1
pkgdesc='Extension layer for SILE and resilient'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('7ef4496f3dd75b18b2c5030191df7ab5e1c5992803b0cca0a0053ed4cdac116c')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
