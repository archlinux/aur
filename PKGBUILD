# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
# Contributor: Florian Walch <florian.walch@gmx.at>
pkgname=tryton
pkgver=4.0.3
_pkgdir=4.0
pkgrel=2
pkgdesc="A three-tiers high-level general purpose application platform (client application)"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python2>=2.7' 'gtk2' 'pygtk>=2.22' 'librsvg' 'python2-dateutil' 'python2-chardet')
optdepends=('python2-simplejson: Faster JSON processing'
            'python2-cdecimal: Faster decimal handling')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$pkgname-$pkgver.tar.gz"
        "http://downloads.tryton.org/$_pkgdir/$pkgname-$pkgver.tar.gz.asc"
        'tryton.desktop')
md5sums=('fcf68e75cf1e4d382e9981effe37ffe0'
         'SKIP'
         '7ca15ad6c790c78817fe1a1b6a2c3fcf')
validpgpkeys=('7C5A4360F6DF81ABA91FD54D6FF50AFE03489130') # Cédric Krier

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
