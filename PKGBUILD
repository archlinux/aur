# Maintainer: Corentin Peuvrel <corentin.peuvrel at gmail dot com>
pkgname=pysnmp
pkgver=4.3.1
pkgrel=1
pkgdesc="A cross-platform, pure-Python SNMP engine implementation"
arch=(any)
url="http://pysnmp.sourceforge.net/"
license=('BSD')
depends=('python' 'python-pyasn1')
optdepends=('pycrypto: SNMPv3 support')
provides=('python-pysnmp')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('d6cf420d7683a2da97c43e9398042b9c')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
