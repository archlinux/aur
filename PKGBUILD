# Maintainer: Adrian Wheeldon <arandomowl at gmail dot com>
pkgname=workcraft
pkgver=3.3.2
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
  ${pkgname}.desktop
  ${pkgname}.xml
)
md5sums=(
  'fb645790bd4eb47ad80fc31e9c3fc48e'
  '1ec57953a288f3819e6bd98549b15d47'
  'dae559468aaeaf7081c40ee7c6591f6c'
)

package() {
  mkdir -p "$pkgdir"/opt "$pkgdir"/usr/bin
  install -Dm644 "$srcdir/$pkgname/$pkgname".svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/"$pkgname".svg
  install -Dm644 "$srcdir/$pkgname/$pkgname".svg "$pkgdir"/usr/share/icons/hicolor/scalable/mimetypes/application-x-"$pkgname".svg
  mv "$srcdir/$pkgname" "$pkgdir"/opt/"$pkgname"
  ln -s /opt/workcraft/workcraft "$pkgdir"/usr/bin/workcraft
  install -Dm644 "$srcdir/$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
  install -Dm644 "$srcdir/$pkgname".xml "$pkgdir"/usr/share/mime/packages/"$pkgname".xml
}
