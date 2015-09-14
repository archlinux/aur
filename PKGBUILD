pkgname=colobot-gold-data
pkgver=0.1.6_alpha
__ver=0.1.6-alpha
pkgrel=1
pkgdesc="Data pack for Colobot GOLD real-time strategy game."
arch=('any')
url="http://colobot.info"
license=('GPL3')
makedepends=('cmake' 'po4a' 'python2')
source=("https://github.com/colobot/colobot-data/archive/colobot-gold-$__ver.zip")
md5sums=('0c0e2454f046576abd9c7da53102a380')
sha1sums=('418ed18afac8b3ae1435397c354b2b0777fede32')
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
