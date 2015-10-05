# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: Dmitry Korzhevin <dkorzhevin at gmail dot com>

pkgname=sportstracker
pkgver=7.1.0
pkgrel=2
pkgdesc="Application for people who want to track their sporting activities"
arch=('any')
url="http://www.saring.de/sportstracker/"
license=('GPL')
depends=('java-environment')
source=(http://downloads.sourceforge.net/sportstracker/SportsTracker-$pkgver-bin.zip
        sportstracker.sh
        sportstracker.desktop)
sha1sums=('a588df92a3282f2d46fa85f5ca37446762a59d4f'
         '14f7feca091a697ad9b0f6ef73bd3a4dd8797c53'
         '663d2bf00a87c1bddc8bda2c7f6dacd8d869c281')

package() {
  cd $srcdir/SportsTracker-$pkgver-bin

  install -D -m644 sportstracker-$pkgver.jar $pkgdir/usr/share/java/sportstracker/sportstracker-$pkgver.jar
  install -m644 lib/*.jar $pkgdir/usr/share/java/sportstracker

  install -D -m755 $srcdir/sportstracker.sh $pkgdir/usr/bin/sportstracker

  install -D -m644 $srcdir/sportstracker.desktop $pkgdir/usr/share/applications/sportstracker.desktop
  install -D -m644 st-logo-512.png $pkgdir/usr/share/pixmaps/sportstracker.png
}
