# Maintainer: McLenin <mclenin at gooogles email>
pkgname=cublock
pkgver=3.0.3
pkgrel=1
pkgdesc="Cublock is Java implementation of 3D tetris-like game, similar to Blockout(tm)
and is a generalized version of the original game."
arch=(any)
url="http://cublock.sourceforge.net/"
license=('GPL3')
groups=()
depends=('java-runtime')
source=("http://sourceforge.net/projects/cublock/files/Cublock-3-0-3/cublock-3-0-3.tar.gz"
"cublock.desktop"
"cublock.xpm"
)
noextract=()
md5sums=(
"3312fe722e1be1920e630773d09d0abe"
"2d70001ca6b1365326692d99dd3519ef"
"7d9712bc895b091a78ab600b98efeaa1"
) 

package() {
  cd "$srcdir"
  
  install -m 755 -d ${pkgdir}/usr/share/applications
  install -m 755 -d ${pkgdir}/usr/share/pixmaps
  install -m 644 cublock.desktop ${pkgdir}/usr/share/applications/
  install -m 644 cublock.xpm "$pkgdir"/usr/share/pixmaps/cublock.xpm

  cd "$pkgname-3-0-3"

  install -m 755 -d ${pkgdir}/usr/bin
  make DESTDIR="$pkgdir/" install
  
}