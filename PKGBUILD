# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=mygtkmenu
_pkgname=myGtkMenu
pkgver=1.3
pkgrel=7
pkgdesc="A user defined GTK menu for running applications"
arch=('i686' 'x86_64')
url="http://sites.google.com/site/jvinla/$pkgname"
license=('GPL')
depends=('gtk2')
source=("http://sites.google.com/site/jvinla/$_pkgname-$pkgver.tar.gz")
md5sums=('3044ad5bf99bad67af64e4c8b3981dea')
backup=('etc/mygtkmenu.conf')

build() {
  cd $srcdir
  rm $_pkgname
  make
}

package() {
  install -Dm755 $_pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 TestMenu.txt $pkgdir/etc/$pkgname.conf
  install -Dm644 License.txt $pkgdir/usr/share/licenses/$pkgname/License.txt
  install -Dm644 icons/$_pkgname.png $pkgdir/usr/share/icons/hicolor/22x22/apps/$_pkgname.png
  install -Dm644 icons/$_pkgname.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/myGtkMenu.svg
}
