# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
# Contributor: Florian Walch <florian.walch@gmx.at>
pkgname=tryton
pkgver=3.6.1
_pkgdir=3.6
pkgrel=1
pkgdesc="A three-tiers high-level general purpose application platform (client application)"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python2>=2.7' 'gtk2' 'pygtk>=2.0' 'librsvg' 'python2-dateutil')
optdepends=('python2-pytz: timezone support')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$pkgname-$pkgver.tar.gz"
        'tryton.desktop')
md5sums=('223bbdc155c9185dd1556478fa4c049c'
         '7ca15ad6c790c78817fe1a1b6a2c3fcf')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
  install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
