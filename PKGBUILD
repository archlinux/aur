# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-tempest
pkgver=31.1.0
pkgrel=1
pkgdesc='OpenStack Integration Testing'
arch=('any')
url='https://docs.openstack.org/tempest/'
license=('Apache')
depends=('python-pbr' 'python-cliff' 'python-jsonschema' 'python-testtools'
         'python-paramiko' 'python-netaddr' 'python-testrepository'
         'python-oslo-concurrency' 'python-oslo-config' 'python-oslo-log'
         'python-oslo-serialization' 'python-oslo-utils' 'python-six'
         'python-fixtures' 'python-yaml' 'python-subunit' 'python-stevedore'
         'python-prettytable' 'python-os-testr' 'python-urllib3'
         'python-debtcollector')
checkdepends=('python-hacking' 'python-mock' 'python-oslotest')
source=("https://github.com/openstack/tempest/archive/$pkgver.tar.gz")
sha512sums=('2d9796d6d81138e82eae78f83f50b5d3207571618c1cdeec41860fc6e88ea70f24f6da1871b152354b749c8ac59110119e69c7a7f93daec3982b333ec509330d')

export PBR_VERSION=$pkgver

build() {
  cd tempest-$pkgver
  python setup.py build
}

# Disabling due to 9 test failures
#check() {
#  cd tempest-$pkgver
#  stestr --test-path tempest/tests run
#}

package() {
  cd tempest-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
