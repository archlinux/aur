# Maintainer: Elie Bouttier <elie+aur@bouttier.eu>

pkgname='python-ldap3'
pkgver=2.1.0
pkgrel=1
pkgdesc="A strictly RFC 4510 conforming LDAP V3 pure Python client."
arch=('i686' 'x86_64')
url="https://github.com/cannatag/ldap3"
license=('LGPL')
depends=('python' 'python-pyasn1')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/44/53/b458da2329ad57fa0044717cace2fa901ea6999bc141e6d65245f77e4eb8/ldap3-$pkgver.tar.gz)
md5sums=('848276f5479eec54ddf4ba45938fd9e4')
sha256sums=('8a9b0331d9405884ac273106ded1a7d9ad5ba3e309c4bad25bae7dc5774cc809')

build() {
  cd "$srcdir/ldap3-$pkgver"
  python setup.py build
}

package() {
  cd $srcdir/ldap3-$pkgver
  python setup.py install --root $pkgdir
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
