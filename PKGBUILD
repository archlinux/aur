# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=piecharts.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=0.1.0
_rockrel=1
pkgrel=1
pkgdesc='pie charts for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('6c89316d39c2ede8347d06a9f6db1cab10ae119368826d9ddaa07ad90f7be9a3')

package() {
	cd "$_archive"
	luarocks --lua-version="5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
