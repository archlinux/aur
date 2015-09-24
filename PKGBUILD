# Maintainer: Eric Griffis <dedbox at gmail dot com>
pkgname=tipcutils
pkgver=2.0.2
pkgrel=1
pkgdesc="TIPC utilities package for Linux"
arch=('i686' 'x86_64')
url="http://tipc.sourceforge.net/"
license=('BSD')
source=("http://iweb.dl.sourceforge.net/project/tipc/tipc-linux-extras/tipcutils-2.0/$pkgname-$pkgver.tar.gz")
md5sums=('920d24ac5ebe7f5217a26f17a140c018')

build() {
	cd "$pkgname-$pkgver"
        sed -n '/ * Copyright /,/ SUCH DAMAGE./p' tipc-config/tipc-config.c > LICENSE
	make
}

package() {
	cd "$pkgname-$pkgver"
        mkdir -p "$pkgdir/usr/bin"
        mkdir -p "$pkgdir/usr/share/licenses/tipcutils"
        cp LICENSE "$pkgdir/usr/share/licenses/tipcutils"
        cp tipc-config/tipc-config "$pkgdir/usr/bin"
        cp tipc-pipe/tipc-pipe "$pkgdir/usr/bin"
        cp ptts/tipcTS "$pkgdir/usr/bin"
        cp ptts/tipcTC "$pkgdir/usr/bin"
}
