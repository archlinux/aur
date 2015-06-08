pkgname=colobot-gold-music
pkgver=0.1.4_alpha
__ver=0.1.4-alpha
pkgrel=1
pkgdesc="Music pack for Colobot GOLD real-time strategy game."
arch=('any')
url="http://colobot.info"
license=('GPL3')
makedepends=('cmake' 'vorbis-tools')
source=("https://github.com/colobot/colobot-music/archive/colobot-gold-$__ver.zip")
md5sums=('b4b4c1c272ca74acb044aaf8473f113b')
sha1sums=('8b3c037440767db1f239994ca82c57890b81c83b')
_archive_dir="colobot-music-colobot-gold-$__ver"

build() {
    mkdir -p "$srcdir/$_archive_dir/build"
    cd "$srcdir/$_archive_dir/build"
    cmake "$srcdir/$_archive_dir" -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX="/usr"
    make
}

package() {
    cd "$srcdir/$_archive_dir/build"
    make DESTDIR="$pkgdir/" install
}
