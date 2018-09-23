# Maintainer: Andy Botting <andy@andybotting.com>

_module='tempest'
pkgname='python-tempest'
pkgver='19.0.0'
pkgrel='1'
pkgdesc='OpenStack Integration Testing'
arch=('any')
url="http://docs.openstack.org/developer/${_module}/"
license=('Apache')
makedepends=('git' 'python-setuptools')
source=("git+https://git.openstack.org/openstack/${_module}#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_module}"
  python setup.py build
}

package_python-tempest() {
  depends=('python-pbr' 'python-cliff' 'python-jsonschema' 'python-testtools'
           'python-paramiko' 'python-netaddr' 'python-testrepository'
           'python-oslo-concurrency' 'python-oslo-config' 'python-oslo-log'
           'python-oslo-serialization' 'python-oslo-utils' 'python-six'
           'python-fixtures' 'python-yaml' 'python-subunit' 'python-stevedore'
           'python-prettytable' 'python-os-testr' 'python-urllib3'
           'python-debtcollector')
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
