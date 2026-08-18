# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=sifter
pkgname="$_pkgbase-bin"
pkgver=0.1.1
pkgrel=1
pkgdesc='Catalog photos, videos and audio into a date-structured library by capture date'
arch=('x86_64' 'aarch64')
url='https://github.com/SelfRef/sifter'
license=('GPL-3.0-or-later')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source_x86_64=("$_pkgbase-v$pkgver-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-v$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$_pkgbase-v$pkgver-aarch64-linux.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-v$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('8080bb6d2283bdaf48469bcb087495e36c569824fbf280f6ee1cdb32323a8f5e')
sha256sums_aarch64=('24764fa824da64d3deb9286845a3846606d4ac10463c9156da61ceb4adefa7e0')

package() {
	cd "$_pkgbase-v$pkgver-$CARCH-linux"
	install -Dm0755 "$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
