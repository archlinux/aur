pkgname=leleleplayer-git
_gitname=leleleplayer
pkgver=0.1
pkgrel=1
pkgdesc="An audio player wich can find similar songs in your library"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'ffmpeg' 'gtk3')
optdepends=('gst-plugins-bad: Needed for MP3 (and other formats) support'
			'gst-plugins-ugly: Needed for some audio format support')
install="$_gitname.install"
source=('git://github.com/Polochon-street/leleleplayer.git')
md5sums=('SKIP')
 
prepare() {
	cd "$srcdir/$_gitname"
	mkdir -p build
}

build() {
        cd "$srcdir/$_gitname/build"
        cmake .. -DCMAKE_BUILD_TYPE=Release
        make
}
 
package() {
        cd "$srcdir/$_gitname/build"
        make DESTDIR="$pkgdir" install 
} 
