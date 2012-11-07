# Maintainer: Adrian Perez <adrian@perezdecastro.org>
pkgname=fusefat
pkgver=0.3a
pkgrel=1
pkgdesc="User space implementation of the FAT file sustem using FUSE"
arch=(x86_64 i386)
url="http://sourceforge.net/projects/libfat/"
license=('GPL')
depends=(fuse)
source=("http://downloads.sourceforge.net/project/libfat/libfat/$pkgver/libfat-$pkgver.tar.gz")
md5sums=('832e148ae5d191a50c84122e049b718f')

# Weird directory name in the tarball contents...
_pkgdirname=fuse-umfuse-fat-0.1

build() {
  cd "$srcdir/$_pkgdirname"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make fusefat
}

package() {
  cd "$srcdir/$_pkgdirname"
  install -m 755 -d "$pkgdir/bin"
  install -m 755 -t "$pkgdir/bin" fusefat
}

# vim:set ts=2 sw=2 et:
