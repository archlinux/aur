# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=labelrefs.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=0.1.0
_rockrel=1
pkgrel=2
pkgdesc='Cross-referencing package for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('a63274d237c4a44e666c29e4d6dee9ce234a6b871bf9ddba64b95021d14a8d9c')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
