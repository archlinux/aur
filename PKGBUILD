# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='rage'
pkgname="rust-$_pkgname-bin"
pkgver='0.2.0'
pkgrel='1'
pkgdesc='Rust implementation of the age encryption tool - binary version'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/str4d/$_pkgname"
license=('Apache' 'MIT')
depends=('fuse2')
provides=("rust-$_pkgname")
conflicts=("rust-$_pkgname")
_releaseurl="$url/releases/download/v$pkgver"
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.tar.gz::$_releaseurl/rage-v$pkgver-x86_64-linux.tar.gz")
source_armv7h=("$pkgname-$pkgver-$pkgrel-armv7h.tar.gz::$_releaseurl/rage-v$pkgver-armv7-linux.tar.gz")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64.tar.gz::$_releaseurl/rage-v$pkgver-arm64-linux.tar.gz")
source=("$pkgname-$pkgver-$pkgrel-LICENSE-MIT::$url/raw/v$pkgver/LICENSE-MIT")
sha256sums=('fe56c030c2d8c3404a37fe711cebb27ebea13d0aacf7e3524db4198335ad8cd1')
sha256sums_x86_64=('238c67d4f489f510488d23bd60b0e900ecb0ed8c5ad62abf216f1c2846a823f4')
sha256sums_armv7h=('987b12e7482e4c5e5e3eed066fe3cd1a2c941aeb1307bf8ce611fb7cdea77239')
sha256sums_aarch64=('56aee676deaf7d319b2098bbed78af346b03fcec6c6437ee1a955fd79134f6f7')

package() {
	cd "$srcdir/$_pkgname/"
	for _binary in "$_pkgname" "$_pkgname-keygen" "$_pkgname-mount"; do
		install -Dm755 "$_binary" "$pkgdir/usr/bin/$_binary"
	done
	install -Dm644 "../$pkgname-$pkgver-$pkgrel-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
