pkgname=python2-pysnmp
_tarname=pysnmp
pkgver=4.3.1
pkgrel=1
pkgdesc="A cross-platform, pure-Python SNMP engine implementation (for Python 2)"
arch=(any)
url="http://pysnmp.sourceforge.net/"
license=('BSD')
depends=('python2' 'python2-pyasn1')
optdepends=('python2-pycrypto: SNMPv3 support')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('7720b7cf3913e26192eb6300012a232e')
sha256sums=('368508d691a21dd8f45ef6ebe8c208e4e272c2d7b3b16c29e31df9207812e23f')

package() {
  cd "$srcdir/$_tarname-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
