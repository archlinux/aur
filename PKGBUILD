# Maintainer:
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Nathan Curry <thegnu@gmail.com>

pkgname=rox-lib
pkgver=2.0.6
pkgrel=5
pkgdesc="Shared code which can be used by other ROX applications. This is rox-lib2"
arch=('any')
url="http://rox.sourceforge.net/desktop/ROX-Lib"
license=('LGPL')
depends=('pygtk')
provides=('rox-lib2')
source=("http://downloads.sourceforge.net/rox/${pkgname}2-${pkgver}.tar.bz2")
md5sums=('2ce82c16a56fac66b27ac258972e4dbc')

build() {
  cd "$srcdir/${pkgname}2-$pkgver/ROX-Lib2"
  sed -i "s|\(env python\).*|\12|" $(grep -rl "env python" .)
  sed -i '11,$d' AppRun 
  ./AppRun
}

package() {
  cd "$srcdir/${pkgname}2-$pkgver"
  install -d "$pkgdir/usr/lib"
  cp -a ROX-Lib2 "$pkgdir/usr/lib"
}
