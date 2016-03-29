pkgname=colobot-gold-data
pkgver=0.1.7_alpha
__ver=0.1.7-alpha
pkgrel=2
pkgdesc="Data pack for Colobot GOLD real-time strategy game."
arch=('any')
url="http://colobot.info"
license=('GPL3')
makedepends=('cmake' 'python2')
source=("https://github.com/colobot/colobot-data/archive/colobot-gold-$__ver.zip")
md5sums=('caa827452f4407b3a79386b7f6d79fe8')
sha1sums=('7387c220c3eef11aadbfe62a8c5f5f40278ee359')
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
