# $Id: PKGBUILD 215807 2014-06-30 16:10:14Z fyan $
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=emovix
pkgver=0.9.0
pkgrel=6
pkgdesc="Create Movix-CD's (also emovix plugin for k3b)"
arch=('any')
url="http://movix.sourceforge.net/"
license=('GPL2')
depends=('perl' 'cdrkit')
options=('!makeflags')
source=("http://downloads.sourceforge.net/sourceforge/movix/$pkgname-$pkgver.tar.gz")
md5sums=('a96492f338824b24c5a9e714c57eddcf')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  find $pkgdir/usr/share/emovix -type d -exec chmod 755 {} \;
}
