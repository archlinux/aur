# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='hlsdl'
pkgver='0.27'
_commit='cbf4301a912a3c0bbb418bd92b861f390f9c519c'
pkgrel='1'
pkgdesc='C program to download VoD HLS (.m3u8) files'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/selsta/$pkgname"
license=('MIT')
depends=('curl' 'openssl')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('fadc627f8695f71ca774ad728f85d230b40a22ddd1f28af4bfc81d0c68d916d1')

_sourcedirectory="$pkgname-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	make
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
