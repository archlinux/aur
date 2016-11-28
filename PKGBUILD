# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
# Contributor: Albert Graef <aggraef at gmail dot com>
# Contributor: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: svoufff <svoufff at gmail dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=qmidiroute
pkgver=0.4.0
pkgrel=3
pkgdesc="a filter/router for MIDI events"
arch=('i686' 'x86_64')
url="http://alsamodular.sourceforge.net/"
license=('GPL')
depends=('alsa-lib' 'qt5-base' 'qt5-tools' 'hicolor-icon-theme')
source=(http://downloads.sourceforge.net/alsamodular/$pkgname-$pkgver.tar.bz2)
md5sums=('eac3b97814e372cef4068f2d06263269')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-qt5
  make
}

package() { 
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # Install doc
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -m644 {ChangeLog,NEWS,README,TODO} $pkgdir/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:
