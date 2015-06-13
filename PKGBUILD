# Maintainer: S.Leduc <sebastien@sleduc.fr>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Adam "falcon7" Chidlow <falcon7 _AT_ standardnerd.org>

pkgname=python-gmpy
pkgver=1.17
pkgrel=2
pkgdesc="Python extension that wraps GMP to provide fast multiprecision arithmetic. Last of the 1.x series, see gmpy2 for new developments."
arch=('i686' 'x86_64')
url="http://code.google.com/p/gmpy/"
license=('LGPL2.1')
depends=('python' 'gmp')
options=(!emptydirs)
source=("http://gmpy.googlecode.com/files/gmpy-${pkgver}.zip")
md5sums=('2bf419076b06e107167e219f60ac6d27')


package() {
  cd "$srcdir/gmpy-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -d -m 755 $pkgdir/usr/share/doc/$pkgname
  install -m 644 -t $pkgdir/usr/share/doc/$pkgname doc/*
}

# vim:set ts=2 sw=2 et:
