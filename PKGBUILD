# Maintainer: Flori4nK <contact@flori4nk.de>

pkgname=netvisix
_pkgname=Netvisix
pkgver=1.4.0
pkgrel=1
pkgdesc="A utility to visualize the network packet flow between hosts"
url="https://github.com/bewue/Netvisix"
arch=('x86_64')
license=('GPL')
depends=('qt5-base' 'libpcap')
source=("https://github.com/bewue/$_pkgname/archive/v$pkgver.zip")
md5sums=('4d3a90954f2dbfaf8af17ba5fb088e3c')

build() {
        cd "$srcdir/$_pkgname-$pkgver"
		mkdir -p build
		cd build
		qmake ../$_pkgname/$_pkgname.pro
        make
}

package() {
	install -d "$pkgdir/usr/bin/"
	install -D "$srcdir/$_pkgname-$pkgver/build/$_pkgname" "$pkgdir/usr/bin/"
}