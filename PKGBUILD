# Maintainer: Foppe Hemminga "Afwas" <foppe@foppe.org

pkgname=sayonara-player
pkgver=0.6.6
pkgrel=2
_rev=r1042
pkgdesc="Linux music player written in C++. It supports all common audio files (like mp3, wav, flac, ogg...). The main focus is on managing your music library."
arch=('i686' 'x86_64')
url="http://sayonara-player.com"
license=('GPL3')
depends=( 'qt4' 'curl' 'taglib' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'libnotify' )
optdepends=( 'lame: A high quality MPEG Audio Layer III (MP3) encoder' 'gst-plugins-ugly: GStreamer Multimedia Framework Ugly Plugins' )
makedepends=('cmake')
conflicts=('sayonara-player-svn')
source=( "ftp://sayonara-player.com/sayonara/sayonara-player-${_rev}.tar.gz" )
md5sums=( '621ccc853d35997173f9f386747b7528' )

build() {
    mkdir -p "$srcdir/$pkgname"
    cd "$srcdir/$pkgname"
	cmake .
	make
}

package() {
	cd "$srcdir/$pkgname"
	make prefix=/usr DESTDIR="$pkgdir/" install
}

