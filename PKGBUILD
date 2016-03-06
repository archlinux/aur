# Maintainer: Simon Schuster $(echo "aur . remove stuff like this . schuster.re" | sed 's/ . remove stuff like this . /@/g')

pkgname=ncp
pkgver=1.2.4
pkgrel=1
pkgdesc="A fast file copy tool for LANs"
arch=('i686' 'x86_64')
url="http://www.fefe.de/ncp/"
license=('custom')
groups=()
makedepends=(libowfat dietlibc)
source=("https://dl.fefe.de/$pkgname-$pkgver.tar.bz2"
        "https://dl.fefe.de/$pkgname-$pkgver.tar.bz2.sig")
md5sums=('421c4855bd3148b7d0a4342942b4bf13' 'ac496f2913a016cf987e28303bb04d94')
validpgpkeys=('878CBE5DA9A50595E674183F15396A7933EB059A') # Felix von Leitner, expired

build() {
	cd "$pkgname-$pkgver"
	sed -i 's/\/man\//\/share\/man\//' GNUmakefile
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
}
