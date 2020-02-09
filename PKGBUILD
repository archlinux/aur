# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: palbo <quuxbaz@gmail.com>

pkgname=ccx2
pkgver=0.2.0
pkgrel=2
pkgdesc="Console client for xmms2"
arch=(any)
url="https://pflouret.github.io/ccx2/"
license=("BSD")
depends=("ncurses" "python2" "xmms2")
optdepends=("pil: for cover art display"
            "python2-lxml: for lyrics display"
            "python2-simplejson: for lyrics display, if python < 2.6")
source=("$pkgname-$pkgver.tar.gz::https://github.com/palbo/$pkgname/archive/v${pkgver}.tar.gz")
sha512sums=('b855508b9181846a7c4c36e3aaba6c1d90ee3c10825770bd5c91c416c9fb46ec347e85c9c308f0f2b0b2a8dc95f9ef8102c8e8f0d604eb580c04c9589daaca82')


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
