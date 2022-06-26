#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="communist"
pkgver="1.4.1"
pkgrel="1"
pkgdesc="Communist is a simple GTK4 based p2p messenger"
license=('GPL3')
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/communist/archive/refs/tags/v1.4.1.tar.gz")
url="https://github.com/ProfessorNavigator/communist"
makedepends=('meson' 'ninja' 'pkgconf' 'gcc' 'gtkmm-4.0' 'hunspell' 'libtorrent-rasterbar' 'libgcrypt' 'libzip' 'icu' 'boost')
depends=('gtkmm-4.0' 'hunspell' 'libtorrent-rasterbar' 'libgcrypt' 'libzip' 'icu' 'gst-plugins-good')
sha256sums=('698fa991735ede8253bfddb0e34044fcfd9207e800ee7e6d756500b1ca355779')
options=(strip)

build() {   
   mkdir -p $srcdir/builddir
   cd $srcdir/$pkgname-$pkgver
   meson -Dprefix=/usr -Dbuildtype=release $srcdir/builddir
   cd $srcdir/builddir
   ninja 
}

package() {
    cd $srcdir/builddir
    DESTDIR=$pkgdir ninja install
}
