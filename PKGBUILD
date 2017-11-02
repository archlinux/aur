# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>
pkgname=ramroot
pkgver=1.1.1
pkgrel=1
pkgdesc="Load root and /boot partitions to RAM during boot"
arch=('any')
url="https://github.com/arcmags/$pkgname"
license=('GPL')
depends=('sudo')
conflicts=('liveroot')
install=ramroot.install
source=("$pkgname-$pkgver.tar.gz.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('f71f0653947cd5f6f88ab4e82df6767a')

package() {
	cd "$pkgname-$pkgver"
    install -D -m644 ./lib/hooks/ramroot \
        "$pkgdir/usr/lib/ramroot/hooks/ramroot"
    install -D -m644 ./lib/install/ramroot \
        "$pkgdir/usr/lib/ramroot/install/ramroot"
    install -D -m755 ./ramroot "$pkgdir/usr/bin/ramroot"
}
