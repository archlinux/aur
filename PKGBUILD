# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>
pkgname=genpo
pkgver=0.9.8
pkgrel=2
pkgdesc="The GENeral Purpose Organ, which replicates the essential features of any pipe, theatre, or reed organ."
arch=('i686' 'x86_64')
url="http://genpo.sourceforge.net/"
license=('GPL')
depends=('alsa-lib' 'qt4')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/GENPO-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('79a6a7eca2fbb681d4ddfa453498372a')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  qmake-qt4
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
  install -D -m755 genpo $pkgdir/usr/bin/genpo
  cd "$srcdir/$pkgname-$pkgver/organs"
  for file in *
    do install -D -m644 $file $pkgdir/usr/share/${pkgname}/organs/$file
  done
}

# vim:set ts=2 sw=2 et:
