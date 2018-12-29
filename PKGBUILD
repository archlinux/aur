# Maintainer: Timothy Brown <sysop@timb.us>
pkgname=adjtimex
pkgver=1.29_10
pkgrel=1
pkgdesc="Allows configuration of kernel time variables"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
 url="https://github.com/rogers0/adjtimex"
license=('GPL2')
depends=('glibc')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://github.com/rogers0/adjtimex/archive/debian/${pkgver//_/-}.tar.gz"
        )
build() {
	cd "$pkgname-debian-${pkgver//_/-}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-debian-${pkgver//_/-}"
        install -d ${pkgdir}/usr/{bin,share/man/man8}
	make prefix="$pkgdir/usr" bindir="$pkgdir/usr/bin" install
        chown root:root $pkgdir/usr/bin/adjtimex
}
md5sums=('56e5c86c5fd5ef95d18673b2ed18e3f7')
