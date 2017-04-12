# Maintainer: Andy Botting <andy@andybotting.com>

_module='reno'
pkgname='python-reno'
pkgver='2.2.0'
pkgrel='2'
pkgdesc='OpenStack RElease NOtes manager'
arch=('any')
url="https://docs.openstack.org/developer/${_module}/"
license=('Apache')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pbr' 'python-oslotest' 'python-mock' 'python-dulwich')
source=("git+https://git.openstack.org/openstack/reno#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_module}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_module}"
  python setup.py testr
}

package_python-reno() {
  depends=('python-pbr' 'python-babel' 'python-yaml' 'python-six'
           'python-dulwich')
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
