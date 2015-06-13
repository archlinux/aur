# Maintainer: S.Leduc <sebastien@sleduc.fr>
# Contributor: Adam "falcon7" Chidlow <falcon7 _AT_ standardnerd.org>

pkgname=python2-gmpy
pkgver=1.17
pkgrel=1
pkgdesc="Python extension that wraps GMP to provide fast multiprecision arithmetic. Last of the 1.x series, see gmpy2 for new developments."
arch=('i686' 'x86_64')
url="http://code.google.com/p/gmpy/"
license=('LGPL2.1')
depends=('python2' 'gmp')
options=(!emptydirs)
source=("http://gmpy.googlecode.com/files/gmpy-${pkgver}.zip")
md5sums=('2bf419076b06e107167e219f60ac6d27')

package() {
  cd "$srcdir/gmpy-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1

  install -d -m 755 $pkgdir/usr/share/doc/$pkgname
  install -m 644 -t $pkgdir/usr/share/doc/$pkgname doc/*
}

# vim:set ts=2 sw=2 et:
