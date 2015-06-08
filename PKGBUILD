# Maintainer: willemw <willemw12@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=jmencode
pkgver=0.64
_libver=1.0.1
pkgrel=5
pkgdesc="Java GUI for encoding video with mencoder"
arch=('any')
url="http://jmencode.sourceforge.net"
license=('GPL3')
depends=('java-runtime' 'mencoder' 'mplayer' 'mkvtoolnix' 'gpac')
makedepends=('unzip')
source=(http://downloads.sourceforge.net/$pkgname/JMencode_v$pkgver.zip
        $pkgname.sh $pkgname.desktop)
md5sums=('e008964c80ace65627e62883652df5af'
         '0250a3c8da1068eff9d750f300d9b32b'
         'de8d95759e1ea1d289c92c13ed3dd3cb')

package() {
  install -D -m644 JMEncode.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"

  # Keep relative path of the extra library because the classpath option doesn't work
  install -D -m644 lib/swing-layout-$_libver.jar \
            "$pkgdir/usr/share/java/$pkgname/lib/swing-layout-$_libver.jar"

  install -D -m755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -D -m644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 $pkgname.desktop \
            "$pkgdir/usr/share/applications/$pkgname.desktop"
}

