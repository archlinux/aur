# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>
pkgname=ramroot
pkgver=1.1.4
pkgrel=1
pkgdesc="Load root filesystem completely to RAM during boot"
arch=('any')
url="https://github.com/arcmags/$pkgname"
license=('GPL')
depends=('sudo')
conflicts=('liveroot')
install=ramroot.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('b197ef1610b696ff1da9abf2ec7489ea')

package() {
	cd "$pkgname-$pkgver"
    install -D -m644 ./lib/hooks/ramroot \
        "$pkgdir/usr/lib/ramroot/hooks/ramroot"
    install -D -m644 ./lib/install/ramroot \
        "$pkgdir/usr/lib/ramroot/install/ramroot"
    install -D -m755 ./ramroot \
        "$pkgdir/usr/bin/ramroot"
    install -D -m644 ./lib/man/ramroot.8 \
        "$pkgdir/usr/share/man/man8/ramroot.8"
}
