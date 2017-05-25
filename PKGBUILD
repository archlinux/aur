pkgname=colobot-gold-data
pkgver=0.1.10_alpha
__ver=0.1.10-alpha
pkgrel=1
pkgdesc="Data pack for Colobot GOLD real-time strategy game."
arch=('any')
url="http://colobot.info"
license=('GPL3')
makedepends=('cmake' 'python2')
source=("https://github.com/colobot/colobot-data/archive/colobot-gold-$__ver.zip")
md5sums=('dc8291e36bf9366163b187d5cf817d58')
sha1sums=('f62bf6a107501e0655bff6de5b259450f16e1cf3')
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
