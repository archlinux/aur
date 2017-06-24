# Maintainer: Jeroen Rijken <jeroen dot rijken at gmail dot com>

pkgname=archi
pkgver=4.0.2
pkgrel=1
pkgdesc="Free, open source, cross-platform tool and editor to create ArchiMate models."
arch=('x86_64')
url="http://www.archimatetool.com/"
license=('MIT')
depends=('java-runtime>=1.8' 'webkitgtk')
provides=('archi')
source=(https://archimatetool.com/downloads/release/v4/Archi-Linux64-$pkgver.tar.gz $pkgname.desktop)
sha256sums=('113685ff3ad12bfd9880ac1b821c89ebdaae3b805a7aa0f88e57a56649dcfcf6'
            'eb97e9fb2af5b15b710ddace817d08fe73055d27816aaf790a6cd6bf26643714')

package() {
  cd $srcdir
  install -d -m755 $pkgdir/{opt/,/usr/{,share/{pixmaps,applications,licenses/$pkgname,doc/$pkgname}}}
  
  install -m644 $srcdir/Archi/docs/* $pkgdir/usr/share/doc/$pkgname/
  install -m644 $srcdir/Archi/README $pkgdir/usr/share/doc/$pkgname/
  install -m644 $srcdir/Archi/icon.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
  install -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  
  rm -R $srcdir/Archi/docs
  rm $srcdir/Archi/icon.xpm $srcdir/Archi/README $srcdir/Archi/Archi-Ubuntu.sh
  cp -R $srcdir/Archi/ $pkgdir/opt/$pkgname

  chmod 755 $pkgdir/opt/$pkgname/Archi
}

