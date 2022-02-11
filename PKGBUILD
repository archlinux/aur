
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid-bin
_pkgname=${pkgname%-*}
pkgver=1.8.1
pkgrel=1
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://gmid.omarpolo.com'
license=('ISC')
provides=('gmid')
conflicts=('gmid' 'gmid-git')
depends=('libretls')
source=("https://github.com/omar-polo/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver-binaries.tar.gz")
sha256sums=('7983a89f427bbdfb00ea118ff0471d8291afaa370814d7a93d6be294644592f7')

package() {
	cd "$srcdir/$_pkgname-$pkgver-binaries"
	install -Dm755 "gmid.linux.amd64" "$pkgdir/usr/bin/gmid"
	install -Dm755 "gg.linux.amd64" "$pkgdir/usr/bin/gg"
	install -Dm644 gmid.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 gg.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
