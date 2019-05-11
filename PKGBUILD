# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-ironicclient
pkgver='2.7.1'
pkgrel='1'
pkgdesc='Python client library for Ironic'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-six' 'python-requests' 'python-yaml'
         'python-openstackclient' 'python-prettytable' 'python-oslo-utils'
         'python-oslo-serialization' 'python-oslo-i18n' 'python-osc-lib'
         'python-keystoneauth1' 'python-jsonschema' 'python-dogpile.cache'
         'python-appdirs' 'python-pbr')
checkdepends=('python-fixtures' 'python-requests-mock' 'python-mock'
              'python-babel' 'python-oslotest' 'python-testtools' 'python-tempest'
              'python-stestr' 'python-ddt' 'python-openstackclient')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('54411c7a111f8365910386992b6d916ebb736f693a0341d4332f5adb1013ebba89fa50c1e4b1bdd5437355cf974aaf4e12ef4d51cbe75e01047d09c8d13f7ab8')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  stestr run
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
