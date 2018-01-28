# Maintainer: ninian <mcfadzean.org.uk ta linux>

pkgname=treeline-unstable
_pkg=${pkgname%%-*}
pkgver=2.9.0
pkgrel=1
pkgdesc="Tree outliner and PIM which stores any kind of information within a tree structure; unstable development snapshot"
arch=('any')
url="http://treeline.bellz.org"
license=('GPL2')
depends=('python-lxml' 'python-pyqt5')
optdepends=('aspell' 'ispell' 'hunspell')
conflicts=('treeline')
replaces=('treeline')
source=("http://sourceforge.net/projects/treeline/files/${pkgver}/treeline-${pkgver}.tar.gz/download")
md5sums=('c27d6af5162bb9a181f6d520e2590919')

package() {
  cd "$srcdir/TreeLine"
  python install.py -p /usr -b  "$pkgdir"
  cd ../..
  install -Dm644 $_pkg.desktop  "$pkgdir/usr/share/applications/$_pkg.desktop"
  install -Dm644 $_pkg.xml      "$pkgdir/usr/share/mime/packages/x-$_pkg.xml"
}
