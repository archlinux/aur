# Maintainer: Jeandre Le Roux <theblazehen@gmail.com>
# Co-Maintainer: jzbor <zborof at posteo dot de>

pkgname=xmenu
pkgver=4.5.5
pkgrel=3
pkgdesc="A menu utility for X."
arch=(x86_64 i686 aarch64)
url="https://github.com/phillbush/xmenu"
license=(MIT)
depends=(imlib2 libxinerama)
makedepends=(libxft)
provides=("xmenu")
source=("https://github.com/phillbush/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("cb544095915c4e3217766609be6cbafc")

build() {
	cd "$pkgname-$pkgver"
	make
}

package () {
	cd $pkgname-$pkgver
	make PREFIX="$pkgdir/usr" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
