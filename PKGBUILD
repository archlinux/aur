pkgname=bliss-git
_gitname=bliss
pkgver=0.2.0
pkgrel=1
pkgdesc="A music analyzer library"
arch=('i686' 'x86_64')
license=('MIT')
depends=('ffmpeg' 'gtk3')
source=('git://github.com/Polochon-street/bliss')
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
