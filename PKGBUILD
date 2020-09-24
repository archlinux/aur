# Maintainer: Adrian Wheeldon <arandomowl at gmail dot com>
pkgname=workcraft
pkgver=3.3.0
pkgrel=3
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
  chmod 755 "$pkgdir"/opt/workcraft/libraries
  chmod 755 "$pkgdir"/opt/workcraft/libraries/*
  chmod 755 "$pkgdir"/opt/workcraft/tools
  chmod 755 "$pkgdir"/opt/workcraft/tools/*
  chmod 755 "$pkgdir"/opt/workcraft/tools/ATACS/atacs
  chmod 755 "$pkgdir"/opt/workcraft/tools/Espresso/espresso
  chmod 755 "$pkgdir"/opt/workcraft/tools/PGMiner/pgminer
  chmod 755 "$pkgdir"/opt/workcraft/tools/PetrifyTools/petrify
  chmod 755 "$pkgdir"/opt/workcraft/tools/ScEnco/scenco
  chmod 755 "$pkgdir"/opt/workcraft/tools/vxm/vxm
  chmod 755 "$pkgdir"/opt/workcraft/workcraft
  ln -s /opt/workcraft/workcraft "$pkgdir"/usr/bin/workcraft
}
md5sums=('94576e2781dd01bf43d8edad91025d86')
