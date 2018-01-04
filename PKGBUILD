# Maintainer: Antony Kellermann <aokellermann@gmail.com>

pkgname=getcrypt
pkgver=1.002
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
    cd "$pkgname"
    cd "$srcdir/$pkgname"
    CPPFLAGS="$CPPFLAGS -O2"
	make
}

package() {
	install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/$pkgname/usr/bin/$pkgname"
}