# Contributor: Luis Useche <useche@gmail.com>
# Contributor: Hubert Kario <kario@wit.edu.pl>
# Contributor: Maxime Lorrillere <maxime.lorrillere@gmail.com>

pkgname=filebench
pkgver=1.4.9.1
pkgrel=2
pkgdesc="FileBench is a framework of file system workloads for measuring and comparing file system performance"
arch=(i686 x86_64)
url="http://filebench.sourceforge.net"
license=('CDDL')
depends=(perl libaio libtecla)
options=(docs)
install=
source=(http://downloads.sourceforge.net/sourceforge/filebench/$pkgname-$pkgver.tar.gz)
md5sums=('e30a4feb78ce5e8224c7ec15fd337e42')
         

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
