# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=snmpsim
pkgver=0.1.3
pkgrel=1
pkgdesc="a software that would act like a multitude of real physical devices from SNMP Manager's point of view"
arch=(any)
url="http://snmpsim.sourceforge.net/"
license=('BSD')
depends=('python' 'python-pysnmp' 'python-pyasn1')
optdepends=('pycrypto: SNMPv3 support')
options=(!emptydirs)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('93719ca49ed013c3819a1f057a412347')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '1i #!/usr/bin/env python' build/scripts-3.2/*.py
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
