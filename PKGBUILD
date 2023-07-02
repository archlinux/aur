# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-ironicclient
pkgver=5.2.0
pkgrel=2
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
source=("https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('412a23a562c5da100507291cf9a92104225183191e13f33c7c01e3f14ddf3599a79d69d2be289c28cd891ffeb63ae1e0a2755961ac6d3fe692b2732457416ea2')

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
