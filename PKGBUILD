# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=embedders.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.1.0
_rockrel=1
pkgrel=1
pkgdesc='Graphviz, Lilypond (etc.) support for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('5adefc135f9008d1294e0f827067cf23c9bbeb11df9eba186df72ca5a094dfc3')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
