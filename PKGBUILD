pkgname=colobot-gold-music
pkgver=0.1.5_alpha
__ver=0.1.5-alpha
pkgrel=1
pkgdesc="Music pack for Colobot GOLD real-time strategy game."
arch=('any')
url="http://colobot.info"
license=('GPL3')
makedepends=('cmake' 'vorbis-tools')
source=("https://github.com/colobot/colobot-music/archive/colobot-gold-$__ver.zip")
md5sums=('16a520a6f8489d912c5be8551aeb161b')
sha1sums=('fe79ae7039de6b06d0d34258c946d713b8e6576c')
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
