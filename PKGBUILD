# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Giovanni Scafora <linuxmania@gmail.com>

pkgname=pyvnc2swf
pkgver=0.9.5
pkgrel=2
pkgdesc="A screen recording tool for swf and flv formats"
arch=('i686' 'x86_64')
url="http://www.unixuser.org/~euske/vnc2swf/pyvnc2swf.html"
license=('GPL')
depends=('python2-pygame>=1.6' 'x11vnc')
optdepends=('python2-pymedia>=1.3.5: MPEG encoding')
source=(http://www.unixuser.org/~euske/vnc2swf/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver-setup.diff)
md5sums=('af9737400d605b16f7283b4d2615f207'
         '3577219348e31ac99d746cb1ccf2269c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver-setup.diff
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
