# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: palbo <quuxbaz@gmail.com>

pkgname=ccx2
pkgver=0.2.0
pkgrel=2
pkgdesc="Console client for xmms2"
arch=(any)
url="http://palbo.github.com/ccx2"
license=("BSD")
depends=("ncurses" "python2" "xmms2")
optdepends=("pil: for cover art display"
            "python-lxml: for lyrics display"
            "python-simplejson: for lyrics display, if python < 2.6")
source=("$pkgname-$pkgver.tar.gz::https://github.com/palbo/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('0a055d3acfe94e68c0c9af4ceac3de74')


build() {
  cd $srcdir/$pkgname-$pkgver

  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver

  python2 setup.py install --root=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/ccx2/LICENSE"
  install -D -m644 LICENSE.urwid "$pkgdir/usr/share/licenses/ccx2/LICENSE.urwid"
}
