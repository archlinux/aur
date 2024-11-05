# Maintainer: Zoe Eisendle <zoe.pkgbuild@astech.hu>
pkgname=mptcpd
pkgver=0.13
pkgrel=0
pkgdesc="Multipath TCP daemon"
url="https://github.com/multipath-tcp/mptcpd"
arch=('any')
license=('GPL2')
depends=('ell')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5dd53c9e1c92a3242ad84d93642116e77acb24c997219c98fe30a4c6d80b283de8878bcc84a6ac4eaf51ff6dd32cff5ed2a40a869c8304faa835f3b300dbca37')

build() {
	cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
