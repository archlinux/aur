#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="communist"
pkgver="2.0"
pkgrel="1"
pkgdesc="Simple GTK4 based p2p messenger"
license=('GPL3')
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/communist/archive/refs/tags/v2.0.tar.gz")
url="https://github.com/ProfessorNavigator/communist"
makedepends=('meson' 'ninja' 'pkgconf' 'gcc' 'gtkmm-4.0' 'hunspell' 'icu' 'libcommunist')
depends=('gtkmm-4.0' 'hunspell' 'icu' 'gst-plugins-good' 'libcommunist')
sha256sums=('552f94ffa2a67b254809cd6a567ffebd4bd3ed95c41de58f9eab2f2c23b58195')
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
