# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=sifter
pkgname="$_pkgbase-bin"
pkgver=0.1.0
pkgrel=1
pkgdesc='Catalog photos, videos and audio into a date-structured library by capture date'
arch=('x86_64' 'aarch64')
url='https://github.com/SelfRef/sifter'
license=('GPL-3.0-or-later')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source_x86_64=("$_pkgbase-v$pkgver-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-v$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$_pkgbase-v$pkgver-aarch64-linux.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-v$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('88a88d4e81b5da5304a744765a8b04a2f59a0524603090d9aa840227a8264b50')
sha256sums_aarch64=('22e8694dc4b28074ec06774fbea31cd8fa8a1df8b0469adc4df933d7d2a9a64d')

package() {
	cd "$_pkgbase-v$pkgver-$CARCH-linux"
	install -Dm0755 "$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
