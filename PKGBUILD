# Contributor: Vladimir Gorbunov <truedaemon@gmail.com>

pkgname=python2-svglib
pkgver=0.6.3
pkgrel=4
pkgdesc="An experimental library for reading and converting SVG."
arch=('any')
url="http://pypi.python.org/pypi/svglib/$pkgver"
license=('LGPL')
depends=('python2' 'python2-reportlab')
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/s/svglib/svglib-$pkgver.tar.gz)
md5sums=('454edcfef70d52f62e0e434f2efad853')

prepare() {
  cd "$srcdir/svglib-$pkgver"
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      $(find "$srcdir" -name '*.py')
}

package() {
  cd "$srcdir/svglib-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
