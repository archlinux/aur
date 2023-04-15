# Maintainer: Zoe Eisendle <zoe.pkgbuild@astech.hu>
pkgname=mptcpd
pkgver=0.12
pkgrel=0
pkgdesc="Multipath TCP daemon"
url="https://github.com/intel/mptcpd"
arch=('any')
license=('GPL2')
depends=('ell')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('313ce6f3905192fc614d419d498bfd814632730a50e3119039f076b4cec32360424f237a18cfec8c80a52ea6555a6e21949669ccb85e3178bd83748a2de66f73')

build() {
	cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
