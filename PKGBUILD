# Maintainer: Adrian Wheeldon <arandomowl at gmail dot com>
pkgname=workcraft
pkgver=3.3.5
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
source=(
  http://www.workcraft.org/_media/download/workcraft-v${pkgver}-linux.tar.gz
)
md5sums=(
  '4ea82de15d255f2485bb707928f7ee19'
)

package() {
  mkdir -p "$pkgdir"/opt "$pkgdir"/usr/bin
  install -Dm644 "$srcdir/$pkgname/$pkgname".svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/"$pkgname".svg
  install -Dm644 "$srcdir/$pkgname/$pkgname".svg "$pkgdir"/usr/share/icons/hicolor/scalable/mimetypes/application-x-"$pkgname".svg
  install -Dm644 "$srcdir/$pkgname/$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
  install -Dm644 "$srcdir/$pkgname/$pkgname".xml "$pkgdir"/usr/share/mime/packages/"$pkgname".xml
  mv "$srcdir/$pkgname" "$pkgdir"/opt/"$pkgname"
  ln -s /opt/workcraft/workcraft "$pkgdir"/usr/bin/workcraft
}
