# Contributor: Stefano "GeniE" Faraone <xgotux@gmail.com>

pkgname=njam
pkgver=1.25
pkgrel=6
pkgdesc="Full-featured cross-platform pacman-like game"
url="http://njam.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sdl_image' 'sdl_mixer' 'sdl_net')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.gz njam.desktop)
md5sums=('b49f65a0c5df83de85df4f985337e2eb' 'a2e8f7e419de1b864c31342003ebcd4d')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}-src
  	./configure --prefix=/usr
	make clean || return 1 # Delete the binary files which are distributed in the tar file
  	make || return 1
  	make DESTDIR=${pkgdir} install
	install -Dm644 njamicon.ico ${pkgdir}/usr/share/pixmaps/njamicon.ico
	install -Dm644 ${srcdir}/njam.desktop ${pkgdir}/usr/share/applications/njam.desktop
}
