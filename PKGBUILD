pkgname=python2-pysnmp
_tarname=pysnmp
pkgver=4.3.1
pkgrel=2
pkgdesc="A cross-platform, pure-Python SNMP engine implementation (for Python 2)"
arch=(any)
url="http://pysnmp.sourceforge.net/"
license=('BSD')
depends=('python2' 'python2-pyasn1')
optdepends=('python2-pycrypto: SNMPv3 support')
source=(http://downloads.sourceforge.net/project/$_tarname/$_tarname/$pkgver/$_tarname-$pkgver.tar.gz)
md5sums=('d6cf420d7683a2da97c43e9398042b9c')
sha256sums=('a24c1835a9c0fee7a8b29891650e5531ab0ceac25036129de1c03dc4b76e6129')

package() {
  cd "$srcdir/$_tarname-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
