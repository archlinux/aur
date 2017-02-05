# Maintainer: Elie Bouttier <elie+aur@bouttier.eu>

pkgname='python-ldap3'
pkgver=2.2.0
pkgrel=1
pkgdesc="A strictly RFC 4510 conforming LDAP V3 pure Python client."
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/cannatag/ldap3"
license=('LGPL')
depends=('python' 'python-pyasn1')
makedepends=('python-setuptools')
source=(https://github.com/cannatag/ldap3/archive/v$pkgver.tar.gz)
md5sums=('aa74b8c618c6b1bc16d985013f0afd42')
sha256sums=('e609dbbe3afabae08d43783470e3d9b8769ab5a9852d661d0c83c9e1cece52ec')

build() {
  cd "$srcdir/ldap3-$pkgver"
  python setup.py build
}

package() {
  cd $srcdir/ldap3-$pkgver
  python setup.py install --root $pkgdir
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
