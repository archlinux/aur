# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
pkgname=mysql-utilities
pkgver=1.5.6
pkgrel=1
pkgdesc="A collection of command-line utilities that are used for maintaining and administering MySQL servers"
arch=('any')
url="http://dev.mysql.com/downloads/tools/utilities/"
license=('GPL')
groups=()
depends=('python2-mysql-connector')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://cdn.mysql.com/Downloads/MySQLGUITools/$pkgname-$pkgver.tar.gz)
md5sums=('f86c5d563349c2d8e61085574f86d003')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # Remove files clashing with python2-mysql-connector
  rm -f "$pkgdir/usr/lib/python2.7/site-packages/mysql/__init__.py"
  rm -f "$pkgdir/usr/lib/python2.7/site-packages/mysql/__init__.pyc"
  rm -f "$pkgdir/usr/lib/python2.7/site-packages/mysql/__init__.pyo"
  rm -rf "$pkgdir/usr/lib/python2.7/site-packages/mysql/connector/"
}

# vim:set ts=2 sw=2 et:
