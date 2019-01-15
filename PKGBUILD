# Maintainer: Andy Botting <andy@andybotting.com>

_module='tempest'
pkgname='python-tempest'
pkgver='19.0.0'
pkgrel='2'
pkgdesc='OpenStack Integration Testing'
arch=('any')
url="http://docs.openstack.org/developer/${_module}/"
license=('Apache')
makedepends=('git' 'python-setuptools')
source=("https://github.com/openstack/${_module}/archive/${pkgver}.tar.gz")
sha512sums=('0e782fc77fe71a26888ddbab952e01602db6477d4ad193400aa5cb672159303088996ff2497f1f3f135d4cd002afef93a8a01e4dc3491cc77893fc2f7f4b794c')

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  export PBR_VERSION=$pkgver
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
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
