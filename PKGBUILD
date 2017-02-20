# Maintainer: Corentin Peuvrel <corentin.peuvrel at gmail dot com>
pkgname=pysnmp
pkgver=4.3.3
pkgrel=1
pkgdesc="A cross-platform, pure-Python SNMP engine implementation"
arch=(any)
url="http://pysnmp.sourceforge.net/"
license=('BSD')
depends=('python' 'python-pyasn1')
optdepends=('pycrypto: SNMPv3 support')
provides=('python-pysnmp')
source=(https://github.com/etingof/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('25257decf8c15924e6d02d66dd1b7f1c')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
