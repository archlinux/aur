# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=textsubsuper.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.1.1
_rockrel=1
pkgrel=1
pkgdesc='Real or fake superscripts and subscripts for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('0b4ed51d8a26368329a3b2b99e956fa6e50611116d14c1576af65000dd4325d5')

package() {
	cd "$_archive"
	luarocks --lua-version="5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
