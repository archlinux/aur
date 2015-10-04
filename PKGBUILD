# Maintainer: ninian <mcfadzean.org.uk ta linux>

pkgname=treeline-unstable
_pkg=${pkgname%%-*}
pkgver=2.0.2
pkgrel=1
pkgdesc="Tree outliner and PIM which stores any kind of information within a tree structure; unstable development snapshot"
arch=(any)
url="http://treeline.bellz.org"
license=('GPL2')
depends=('python-lxml' 'python-pyqt4' 'ispell')
conflicts=('treeline')
replaces=('treeline')
install=treeline.install
source=("http://sourceforge.net/projects/treeline/files/${pkgver}/treeline-${pkgver}.tar.gz/download")
md5sums=('d846d7346ea97ae2e23efd59497b4952')

package() {
  cd "$srcdir/TreeLine"
  python install.py -p /usr -b  "$pkgdir"
  cd ../..
  install -Dm644 $_pkg.desktop  "$pkgdir/usr/share/applications/$_pkg.desktop"
  install -Dm644 $_pkg.xml      "$pkgdir/usr/share/mime/packages/x-$_pkg.xml"
}
