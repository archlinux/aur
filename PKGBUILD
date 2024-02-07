# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=piecharts.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=0.2.0
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
sha256sums=('a46ae7f1b61cc2d75d7dd6f0bdec7fa4b933f24601fce4e067a58fcf8db4f7eb')

package() {
	cd "$_archive"
	luarocks --lua-version="5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
