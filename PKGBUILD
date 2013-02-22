# Maintainer: lspci <agm2819 at gmail dot com>
# Contributor: libernux <dutchman55l@gmx.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
pkgname=wmcore
pkgver=0.0.2
pkgrel=3
pkgdesc="A windowmaker dockapp which shows the usage of each core in the system"
arch=('i686' 'x86_64')
url="http://dockapps.windowmaker.org/file.php/id/362"
license=('GPL')
groups=('x11')
depends=('libxext')
source=("http://dockapps.windowmaker.org/download.php/id/917/$pkgname-$pkgver.tar.gz")
md5sums=('26899aba55f84e649178ab8ab18f331e')
 
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make clean
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
#  make install PREFIX="$pkgdir/usr/"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -c $pkgname $pkgdir/usr/bin/
  cd ..
#  install -c README $pkgdir/usr/share/doc/$pkgname/
 # --> Sorry, there doesn't seem to be a README file.
}

