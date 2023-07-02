# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-blazarclient
pkgver=3.6.0
pkgrel=2
pkgdesc='Client library for the Blazar API'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-pbr' 'python-cliff' 'python-prettytable' 'python-oslo-i18n'
         'python-oslo-log' 'python-oslo-utils' 'python-keystoneauth1'
         'python-osc-lib')
checkdepends=('python-oslotest' 'python-fixtures' 'python-stestr'
              'python-testtools')
source=("https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('2063a1426360a5685020c8dda1908956e715ce3f55b1b106ed1a4f4ea7d8a299741339f8f361f31f214c745932742debfd26ebe9d88b2c5d586bef5a551b9ae9')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname
  python setup.py build
}

check() {
  cd $pkgname
  stestr run
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
