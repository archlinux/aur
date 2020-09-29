# Maintainer: Adrian Wheeldon <arandomowl at gmail dot com>
pkgname=workcraft
pkgver=3.3.1
pkgrel=1
pkgdesc="A framework for interpreted graph models including petri nets and STGs"
arch=('i686' 'x86_64')
url="http://www.workcraft.org/"
license=('GPL')
depends=('java-runtime')
optdepends=(
  'graphviz: Graph manipulation',
  'stack: Concepts support')
provides=('workcraft')
conflicts=('workcraft')
source=(http://www.workcraft.org/_media/download/workcraft-v${pkgver}-linux.tar.gz)
prepare() {
  cd "$srcdir"/"$pkgname"
  sed -i 's|^cd "\$(dirname "\$0")"$|cd \$(dirname "\$(readlink -f \$0)")|' workcraft
}
package() {
  cd "$srcdir"/"$pkgname"
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/opt/workcraft
  cp -RP ./* "$pkgdir"/opt/workcraft/
  ln -s /opt/workcraft/workcraft "$pkgdir"/usr/bin/workcraft
}
md5sums=('cb4f9efc85e60e7e97164418c511e7a6')
