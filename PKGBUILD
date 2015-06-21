# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=dbgraph
_pkgname=DBGraph
pkgver=0.1.2
pkgrel=1
pkgdesc="A tool for automatically generating UML database diagrams."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/dbgraph"
license=('GPL')
makedepends=()
depends=('java-runtime' 'desktop-file-utils')
source=("$pkgname.desktop" "${pkgname}_${pkgver}.zip::http://sourceforge.net/projects/dbgraph/files/${_pkgname}%20v0.1/${_pkgname}_${pkgver}.zip/download?nowrap")
md5sums=('6f6699fbd4aa2e734d4507ef7aebcd93' '1aed54b5c23721b85a2587c3bafd7dc8')
install=$pkgname.install

package() {
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  mkdir -p $pkgdir/opt/dbgraph
  cp -R $srcdir/${_pkgname}_${pkgver}/* $pkgdir/opt/dbgraph/
  find $pkgdir/opt/dbgraph -type d -exec chmod 777 {} \;
  find $pkgdir/opt/dbgraph -type f -exec chmod 666 {} \;
}
