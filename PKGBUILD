pkgname=colobot-gold-data
pkgver=0.1.11.1_alpha
__ver=0.1.11.1-alpha
pkgrel=1
pkgdesc="Data pack for Colobot GOLD real-time strategy game."
arch=('any')
url="http://colobot.info"
license=('GPL3')
makedepends=('cmake' 'python2')
source=("https://github.com/colobot/colobot-data/archive/colobot-gold-$__ver.zip")
md5sums=('b5521c7413446f91b74b539ef05821bf')
sha1sums=('3b66e8becbf8e36a5d04aa52ac136084f88dc204')
_archive_dir="colobot-data-colobot-gold-$__ver"
optdepends=('colobot-gold-music: ingame music')


build() {
    mkdir -p "$srcdir/$_archive_dir/build"
    cd "$srcdir/$_archive_dir/build"
    cmake "$srcdir/$_archive_dir" -DCMAKE_INSTALL_PREFIX="/usr" -DMUSIC=0
    make
}

package() {
    cd "$srcdir/$_archive_dir/build"
    make DESTDIR="$pkgdir/" install
}
