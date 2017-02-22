# Maintainer: ninian <mcfadzean.org.uk ta linux>

pkgname=treeline-unstable
_pkg=${pkgname%%-*}
pkgver=2.1.0
pkgrel=1
pkgdesc="Tree outliner and PIM which stores any kind of information within a tree structure; unstable development snapshot"
arch=(any)
url="http://treeline.bellz.org"
license=('GPL2')
depends=('python-lxml' 'python-pyqt5' 'ispell')
conflicts=('treeline')
replaces=('treeline')
install=treeline.install
source=("http://sourceforge.net/projects/treeline/files/${pkgver}/treeline-${pkgver}.tar.gz/download")
md5sums=('66fdff065c9e4eae51e8f129a08d9631')

package() {
  cd "$srcdir/TreeLine"
  python install.py -p /usr -b  "$pkgdir"
  cd ../..
  install -Dm644 $_pkg.desktop  "$pkgdir/usr/share/applications/$_pkg.desktop"
  install -Dm644 $_pkg.xml      "$pkgdir/usr/share/mime/packages/x-$_pkg.xml"
}
