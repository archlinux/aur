# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=tuneroid
pkgver=0.9.5
pkgrel=2
pkgdesc="Tuner for variety of musical instruments (especially guitar)"
url="http://zyzstar.kosoru.com/?tuneroid"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdelibs' 'alsa-lib' 'qt3')
source=("http://zyzstar.kosoru.com/projects/$pkgname/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('d50f940041aa4f3a505c97eae8411382')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/opt/kde --disable-debug 
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
