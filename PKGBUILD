# Maintainer: Antony Kellermann <aokellermann@gmail.com>

pkgname=getcrypt
pkgver=1.020
pkgrel=1
pkgdesc="Command line crypto tracker"
arch=("x86_64")
url="https://github.com/aokellermann/${pkgname}"
license=('GPL3')
depends=("curl")
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git://github.com/aokellermann/${pkgname}")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    CPPFLAGS="$CPPFLAGS -O2"
	make
}

package() {
	install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$pkgname/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}