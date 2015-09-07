# Maintainer: Corentin Peuvrel <corentin.peuvrel at gmail dot com>
pkgname=pysnmp
pkgver=4.2.5
pkgrel=1
pkgdesc="A cross-platform, pure-Python SNMP engine implementation"
arch=(any)
url="http://pysnmp.sourceforge.net/"
license=('BSD')
depends=('python' 'python-pyasn1')
optdepends=('pycrypto: SNMPv3 support')
provides=('python-pysnmp')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('1f75d3e392a050e84348904fc1be3212')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
