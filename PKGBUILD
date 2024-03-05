# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=ptable.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=3.0.0
_rockrel=1
pkgrel=1
pkgdesc='Paragraph boxes, framed boxes and table packages for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e387f48e271dec95d114804b7161c77245e84563963905d55d218690b99bc1a4')

package() {
	cd "$_archive"
	luarocks --lua-version "5.1" --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
