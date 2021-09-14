# Maintainer: Ryan Fantus, mail=$(echo cnlhbmZhbnR1c0BnbWFpbC5jb20K | base64 -d)
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=sndfile-tools
pkgver=1.04
pkgrel=1
pkgdesc="a small collection of programs that use libsndfile and other libraries to do useful things"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.mega-nerd.com/libsndfile/tools"
license=('LGPL')
depends=('fftw' 'cairo' 'jack')
source=("http://www.mega-nerd.com/libsndfile/files/$pkgname-$pkgver.tar.bz2")
md5sums=('0bc8c810c7432bed0a6231c27332551f')

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
