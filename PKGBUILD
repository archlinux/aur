pkgname=python2-pysnmp
_tarname=pysnmp
pkgver=4.3.2
pkgrel=1
pkgdesc="A cross-platform, pure-Python SNMP engine implementation (for Python 2)"
arch=(any)
url="http://pysnmp.sourceforge.net/"
license=('BSD')
depends=('python2' 'python2-pyasn1')
optdepends=('python2-pycrypto: SNMPv3 support')
source=(http://downloads.sourceforge.net/project/$_tarname/$_tarname/$pkgver/$_tarname-$pkgver.tar.gz)
md5sums=('9a4d23c4c1edea1c77faed72c469d8e8')
sha256sums=('7c2bd81df17aa7dca0057a68e7a32284a72231309a0237d66d5b803b5c118977')

package() {
  cd "$srcdir/$_tarname-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
