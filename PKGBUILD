# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: mstrlu <mstrlu _at_ gmx _dot_ net>

_pkgname=ccx2
pkgname=ccx2-git
pkgver=0.2.0.18.g04e2f10
pkgrel=3
pkgdesc="Console client for xmms2"
arch=('any')
url="http://github.com/palbo/ccx2"
license=('BSD')
depends=('ncurses' 'python2' 'xmms2')
optdepends=('python2-imaging: display Cover Art'
	'python2-lxml: display lyrics')
provides=('ccx2')
conflicts=('ccx2')
source=('git://github.com/palbo/ccx2.git')
md5sums=('SKIP')


pkgver() {
	cd $_pkgname
	git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

build() {
  cd $srcdir/$_pkgname

  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname

  python2 setup.py install --root=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/ccx2/LICENSE"
}
