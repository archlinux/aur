# Maintainer: Kolei Chen <chenkolei at gmail dot com>

pkgname=xosview2
pkgver=2.3.5
pkgrel=1
pkgdesc="A lightweight system monitor"
url="https://xosview.sourceforge.net/"
license=('GPL' 'BSD')
arch=('x86_64' 'armv7h' 'aarch64')
depends=('gawk' 'libxext' 'libxft' 'libxpm' 'libsm')
source=("https://downloads.sourceforge.net/project/xosview/xosview2-${pkgver}.tar.gz")
sha512sums=('68a06c78737842324c61d875ad23de1d3556b95d84dbef73fad230fb4e0ca3ba743d8258fb8787b2593587cacb489873c224cc95735429df145012075c6345ae')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
