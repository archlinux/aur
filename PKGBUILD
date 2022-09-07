#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="communist"
pkgver="2.0.1"
pkgrel="1"
pkgdesc="Simple GTK4 based p2p messenger"
license=('GPL3')
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/communist/archive/refs/tags/v2.0.1.tar.gz")
url="https://github.com/ProfessorNavigator/communist"
makedepends=('meson' 'ninja' 'pkgconf' 'gcc' 'gtkmm-4.0' 'hunspell' 'icu' 'libcommunist')
depends=('gtkmm-4.0' 'hunspell' 'icu' 'gst-plugins-good' 'libcommunist')
sha256sums=('0dce384590631fbbb4ab1690c9580b3b9894801bde538e7b86a0a3695a1d06be')
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
