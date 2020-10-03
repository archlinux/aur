# Maintainer: Adrian Wheeldon <arandomowl at gmail dot com>
pkgname=workcraft
pkgver=3.3.1
pkgrel=2
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
  'cb4f9efc85e60e7e97164418c511e7a6'
  '1ec57953a288f3819e6bd98549b15d47'
  'dae559468aaeaf7081c40ee7c6591f6c'
)

package() {
  mkdir -p "$pkgdir"/opt "$pkgdir"/usr/bin
  install -Dm644 "$srcdir/$pkgname"/icon.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/"$pkgname".svg
  install -Dm644 "$srcdir/$pkgname"/icon.svg "$pkgdir"/usr/share/icons/hicolor/scalable/mimetypes/application-x-"$pkgname".svg
  mv "$srcdir/$pkgname" "$pkgdir"/opt/"$pkgname"
  ln -s /opt/workcraft/workcraft "$pkgdir"/usr/bin/workcraft
  install -Dm644 "$srcdir/$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
  install -Dm644 "$srcdir/$pkgname".xml "$pkgdir"/usr/share/mime/packages/"$pkgname".xml
}
