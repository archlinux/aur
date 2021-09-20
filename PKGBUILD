# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=pmenu-pie-menu-git
pkgver=2.3.0
pkgrel=1
pkgdesc='A simple, unixy circular menu for X11. Also known as πmenu'
provides=('pmenu-pie-menu')
conflicts=('pmenu')
depends=('imlib2' 'libx11' 'libxft' 'libxinerama')
arch=('x86_64')
license=('MIT')
url="https://github.com/phillbush/pmenu"
source=("git+$url.git")
md5sums=('SKIP')

build() {
  cd pmenu
  make
}
package() {
  cd pmenu
  install -Dm 755 ./pmenu -t "$pkgdir/usr/bin/"
  install -Dm 644 ./LICENSE -t "$pkgdir/usr/share/licenses/pmenu/"
  install -Dm 644 ./pmenu.1 -t "$pkgdir/usr/share/man/man1/"
}
