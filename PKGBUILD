# Maintainer: Zoe Eisendle <zoe.pkgbuild@astech.hu>
pkgname=mptcpd
pkgver=0.8
pkgrel=1
pkgdesc="Multipath TCP daemon"
url="https://github.com/intel/mptcpd"
arch=('any')
license=('GPL2')
depends=('ell')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('acbbc9d42f8d233ea62276f20034a602395945a95b189c123a222d0312840693872b450233e254b3f2a32dae9265c32f5cd5a1de8c2093755f670aba4d267936')

build() {
	cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
