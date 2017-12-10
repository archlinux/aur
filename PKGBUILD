# Maintainer: Elie Bouttier <elie+aur@bouttier.eu>

pkgname='python-ldap3'
pkgver=2.4
pkgrel=1
pkgdesc="A strictly RFC 4510 conforming LDAP V3 pure Python client."
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/cannatag/ldap3"
license=('LGPL')
depends=('python' 'python-pyasn1')
makedepends=('python-setuptools')
source=(https://github.com/cannatag/ldap3/archive/v$pkgver.tar.gz)
md5sums=('677efe61098f7ec7fec3778c9a7f816a')
sha256sums=('3ab0fa291e434adb1fa020d010caebbf58b9596ef4bc93a0f3d9d11a366e2869')

build() {
  cd "$srcdir/ldap3-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/ldap3-$pkgver"
  python setup.py install --root "$pkgdir"
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
