# Maintainer: Aelius (find me on Freenode)

pkgname=gdevilspie
pkgver=0.5
pkgrel=3
pkgdesc="pyGTK interface to devilspie"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gdevilspie"
license=('GPL')
depends=('pygtk' 'devilspie' 'python2-wnck' 'python2' 'python2-xdg')
makedepends=()
source=(http://gdevilspie.googlecode.com/files/$pkgname-$pkgver.tar.bz2
        xdg_basedirectory.patch)
md5sums=('aab8eecb47599467c65c77d3eddb2d5c'
         'e810b4c7371874931f234d2b8836d3eb')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i $srcdir/xdg_basedirectory.patch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix $pkgdir/usr
  install -m644 -D COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -m644 -D README $pkgdir/usr/share/doc/$pkgname/README
  install -m644 -D gdevilspie.desktop $pkgdir/usr/share/xsessions/gdevilspie.desktop
}
