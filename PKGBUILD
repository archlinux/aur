pkgname=colobot-gold-data
pkgver=0.1.4_alpha
__ver=0.1.4-alpha
pkgrel=1
pkgdesc="Data pack for Colobot GOLD real-time strategy game."
arch=('any')
url="http://colobot.info"
license=('GPL3')
makedepends=('cmake' 'po4a')
source=("https://github.com/colobot/colobot-data/archive/colobot-gold-$__ver.zip")
md5sums=('fcdf80d4e73cf6a1c014e8799c10401a')
sha1sums=('5eac6acd749feb5f0982b169a300ce9b5a9c3f95')
_archive_dir="colobot-data-colobot-gold-$__ver"
optdepends=('colobot-gold-music: ingame music')


build() {
    mkdir -p "$srcdir/$_archive_dir/build"
    cd "$srcdir/$_archive_dir/build"
    cmake "$srcdir/$_archive_dir" -DCMAKE_INSTALL_PREFIX="/usr"
    make
}

package() {
    cd "$srcdir/$_archive_dir/build"
    make DESTDIR="$pkgdir/" install
}
