# Maintainer: Jeroen Rijken <jeroen dot rijken at gmail dot com>

pkgname=archi
pkgver=4.0.1
pkgrel=1
pkgdesc="Free, open source, cross-platform tool and editor to create ArchiMate models."
arch=('x86_64')
url="http://www.archimatetool.com/"
license=('MIT')
depends=('java-runtime>=1.8' 'webkitgtk')
provides=('archi')
source=(https://archimatetool.com/downloads/release/v4/Archi-Linux64-$pkgver.tar.gz $pkgname.desktop)
sha256sums=('037947fa341286b63d98a42b50a1512e8f2bd8cf585007e0d304fb21e833b693'
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

