
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid-bin
_pkgname=${pkgname%-*}
pkgver=1.8
pkgrel=1
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://gmid.omarpolo.com'
license=('ISC')
provides=('gmid')
conflicts=('gmid' 'gmid-git')
depends=('libretls')
source=("https://github.com/omar-polo/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver-binaries.tar.gz")
sha256sums=('9e517a570f3fb5f68f47b9649cc3501c7c8cfbe86ca5d0447f632739a5db99e0')

package() {
	cd "$srcdir/$_pkgname-$pkgver-binaries"
	install -Dm755 "gmid.linux.amd64" "$pkgdir/usr/bin/gmid"
	install -Dm755 "gg.linux.amd64" "$pkgdir/usr/bin/gg"
	install -Dm644 gmid.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 gg.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
