# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=silex.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=0.4.1
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
sha256sums=('46d1f2ff03fa6c1af8fe31d90c40142c6a28787149577b0d10686d1917050fea')

package() {
	cd "$_archive"
	luarocks --lua-version="5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
