# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=office-runner
pkgver=1.0.3
pkgrel=1
pkgdesc="Lighthearted tool to temporarily inhibit GNOME's suspend on lid close behavior"
arch=('x86_64' 'i686')
url="http://www.hadess.net/search/label/office-runner"
license=('GPL3')
depends=('gnome-common')
source=("https://github.com/GNOME/$pkgname/archive/$pkgver.tar.gz")
md5sums=('3918ad54a17860efa9a7f7174158e644')

build() {
	cd $pkgname-$pkgver
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
