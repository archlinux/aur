# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=sndfile-tools
pkgver=1.03
pkgrel=1
pkgdesc="a small collection of programs that use libsndfile and other libraries to do useful things"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.mega-nerd.com/libsndfile/tools"
license=('GPL2')
depends=('fftw' 'cairo' 'jack')
source=("http://www.mega-nerd.com/libsndfile/files/$pkgname-$pkgver.tar.gz")
md5sums=('5b74bb6bb4b2627158f861ae9c45e433')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
