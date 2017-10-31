# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>
pkgname=ramroot
pkgver=1.1.0
pkgrel=1
pkgdesc="load root and /boot partitions to RAM during boot"
arch=('any')
url="https://github.com/arcmags/ramroot"
license=('GPL')
depends=('sudo')
conflicts=('liveroot')
install=ramroot.install
source=("https://github.com/arcmags/$pkgname/archive/$pkgver.tar.gz")
md5sums=('38af1211ce52a41dd0d3548c43a5d47b')

package() {
	cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/lib/ramroot/hooks"
    install -m644 ./lib/hooks/ramroot \
        "$pkgdir/usr/lib/ramroot/hooks/ramroot"

    mkdir -p "$pkgdir/usr/lib/ramroot/install"
    install -m644 ./lib/install/ramroot \
        "$pkgdir/usr/lib/ramroot/install/ramroot"

    mkdir -p "$pkgdir/usr/bin"
    install -m755 ./ramroot "$pkgdir/usr/bin/ramroot"
}
