# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=embedders.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.0.0
_rockrel=1
pkgrel=1
pkgdesc='Graphviz, Lilypond (etc.) support for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(GPL-3.0-only)
depends=(sile)
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('2ed419403418238961f92ace3cb75995ce96402b265439bd7f86701ca5e4a89d')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
