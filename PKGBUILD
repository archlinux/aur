# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=embedders.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=0.1.0
_rockrel=1
pkgrel=1
pkgdesc='Graphviz, Lilypond (etc.) support for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('34a12b14aebc9aef2f481d11128d0ed47597c77eb78dd0d8bb6cced8bf22b651')

package() {
	cd "$_archive"
	luarocks --lua-version="5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}
