# Maintainer: Sijmen J. Mulder <ik@sjmulder.nl>
pkgname=flood
pkgver=1.0.1
pkgrel=1
pkgdesc='Rapidly invoke (flood) a command'
arch=(x86_64)
url=https://github.com/sjmulder/$pkgname
license=(BSD)
depends=(glibc)
source=($pkgname-$pkgver.tar.gz::https://github.com/sjmulder/$pkgname/archive/$pkgver.tar.gz)
sha256sums=(c2a5a61d896e83be65060f8a551ce25e661858bf115b2d6558c79b05c7da5ada)

build() {
	cd $pkgname-$pkgver
	make
}

check() {
	cd $pkgname-$pkgver
	./flood -n1 ls >/dev/null
}

package() {
	cd $pkgname-$pkgver
	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/share/man/man1"
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install $pkgname "$pkgdir/usr/bin/"
	install $pkgname.1 "$pkgdir/usr/share/man/man1/"
	install LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/"
}
