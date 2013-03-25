# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=snmpsim
pkgver=0.2.0
pkgrel=1
pkgdesc="a software that would act like a multitude of real physical devices from SNMP Manager's point of view"
arch=(any)
url="http://snmpsim.sourceforge.net/"
license=('BSD')
depends=('python' 'python-pysnmp' 'python-pyasn1')
optdepends=('pycrypto: SNMPv3 support')
options=(!emptydirs)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('f2c06db6c2c75e6fd3cf2c39127ebfa3')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '1i #!/usr/bin/env python' scripts/*.py
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
