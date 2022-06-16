#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="communist"
pkgver="1.3"
pkgrel="1"
pkgdesc="Communist is a simple GTK4 based p2p messenger"
license=('GPL3')
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/communist/archive/refs/tags/v1.3.tar.gz")
makedepends=('meson' 'ninja' 'pkgconf' 'gcc' 'gtkmm-4.0' 'hunspell' 'libtorrent-rasterbar' 'libgcrypt' 'libzip' 'icu' 'boost')
depends=('gtkmm-4.0' 'hunspell' 'libtorrent-rasterbar' 'libgcrypt' 'libzip' 'icu' 'gst-plugins-good')
md5sums=('923676a7a5eb72194190d7daaf19fe2c')
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
