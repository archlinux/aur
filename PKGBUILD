# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=vibeworld-bin
_pkgname=vibeworld
pkgver=0.17.9
pkgrel=1
pkgdesc="Persistent cyberpunk multiplayer world in your terminal (prebuilt upstream client)"
arch=('x86_64')
url="https://github.com/SorBalda/vibeworld"
license=('custom:PolyForm-Perimeter-1.0.0')
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("$_pkgname-$pkgver-linux-amd64::$url/releases/download/v$pkgver/$_pkgname-linux-amd64")
sha256sums=('6992a17ce724f1d1b703c5b829a465070e00f2f2810a3adfe5e726e482f13cf8')
sha256sums_x86_64=('9ed740d3fb527d438cdc1e3e3bfcaa6fdbc22895651712725cacd63fd3552dfc')

package() {
	install -Dm755 "$srcdir/$_pkgname-$pkgver-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
	cd "$_pkgname-$pkgver"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 TRADEMARK.md "$pkgdir/usr/share/licenses/$pkgname/TRADEMARK.md"
}
