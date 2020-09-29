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
makedepends=('gendesk')
provides=('workcraft')
conflicts=('workcraft')
source=(http://www.workcraft.org/_media/download/workcraft-v${pkgver}-linux.tar.gz)
prepare() {
  gendesk -f -n --name='Workcraft' --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}
package() {
  mkdir -p "$pkgdir"/opt "$pkgdir"/usr/bin
  mv "$srcdir/$pkgname" "$pkgdir"/opt/"$pkgname"
  ln -s /opt/workcraft/workcraft "$pkgdir"/usr/bin/workcraft
  install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
}
md5sums=('cb4f9efc85e60e7e97164418c511e7a6')
