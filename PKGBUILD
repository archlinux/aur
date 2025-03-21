# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='tarnation'
pkgver='1.2.0'
pkgrel='2'
pkgdesc='Simple, extensible backup/restore utility based solely on GNU Tar'
arch=('any')
url="https://github.com/kennyparsons/$pkgname"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('6f3d44804275bffdde2e2e79cb1be64ef79bf7f3d0b6dcdd84e13a0f1a9a9b1cfd22ad7cc1444e4d64b4f83099b1eeb55d7d9ee34d292d3ea1a3c54840b2b089')

_sourcedirectory="$pkgname-$pkgver"

check() {
	_checkoutput="$("$srcdir/$_sourcedirectory/$pkgname.sh" || :)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q 'the backup destination root directory$'
}

package() {
	install -Dm755 "$srcdir/$_sourcedirectory/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
