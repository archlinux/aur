# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='rage'
pkgname="rust-$_pkgname-bin"
pkgver='0.1.1'
pkgrel='1'
pkgdesc='Rust implementation of the age encryption tool - binary version'
arch=('x86_64')
url="https://github.com/str4d/$_pkgname"
license=('Apache' 'MIT')
depends=('fuse2')
provides=("rust-$_pkgname")
conflicts=("rust-$_pkgname")
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/releases/download/v$pkgver/rage-v$pkgver-x86_64-linux.tar.gz"
	"$pkgname-$pkgver-$pkgrel-LICENSE-MIT::$url/raw/v$pkgver/LICENSE-MIT"
)
sha256sums=('9203fb4f6a3b1312f9af900185f7059171f1117e1772bc1bf32643b5797a310a'
            'fe56c030c2d8c3404a37fe711cebb27ebea13d0aacf7e3524db4198335ad8cd1')

package() {
	cd "$srcdir/$_pkgname"
	for binary in "$_pkgname" "$_pkgname-keygen" "$_pkgname-mount"; do
		install -Dm755 "$binary" "$pkgdir/usr/bin/$binary"
	done
	install -Dm644 "../$pkgname-$pkgver-$pkgrel-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
