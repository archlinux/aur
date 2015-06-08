# Maintainer: Valere Monseur <valere_monseur@hotmail.com>

pkgname=mygtkmenu
_pkgname=myGtkMenu
pkgver=1.3
pkgrel=6
pkgdesc="A user defined GTK menu for running applications"
arch=('i686' 'x86_64')
url="http://sites.google.com/site/jvinla/mygtkmenu"
license=('GPL')
depends=('gtk2>=2.4')
source=(http://sites.google.com/site/jvinla/$_pkgname-$pkgver.tar.gz)
md5sums=('3044ad5bf99bad67af64e4c8b3981dea')
backup=('etc/mygtkmenu.conf')

build() {
  cd "$srcdir"

  rm myGtkMenu
  make
}

package() {
  cd "$srcdir"

  install -D -m755 myGtkMenu $pkgdir/usr/bin/mygtkmenu
  install -D -m644 TestMenu.txt $pkgdir/etc/mygtkmenu.conf
  install -D -m644 License.txt "$pkgdir/usr/share/licenses/mygtkmenu/License.txt"
}
