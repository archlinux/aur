# Mantainer: Black_Codec <orso.f.regna@gmail.com>
# Contributor: lp76 <l.peduto@gmail.com>
pkgname=gtk-engine-nodoka
pkgver=0.7.5
pkgrel=2
pkgdesc="Default gtk engine provided by Fedora8"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/nodoka/"
license=('GPL')
depends=('gtk2>2.18')
makedepends=('pkgconfig')
source=(https://fedorahosted.org/releases/n/o/nodoka/gtk-nodoka-engine-$pkgver.tar.gz)
md5sums=('22227adf29231ba2b87202ac3522e70f')
options=(!libtool)

build() {
  cd $srcdir/gtk-nodoka-engine-$pkgver
  sed -i 's|/usr/bin/install|/bin/install|g' $srcdir/gtk-nodoka-engine-$pkgver/src/Makefile.in
  ./configure --prefix=/usr --enable-animation
}

package() {
  cd $srcdir/gtk-nodoka-engine-$pkgver
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
