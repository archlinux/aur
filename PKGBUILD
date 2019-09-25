# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-octaviaclient
pkgver='1.10.0'
pkgrel='1'
pkgdesc='OpenStack Client plugin for Octavia, an OpenStack Load Balancing project'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-appdirs' 'python-babel' 'python-cliff' 'python-cmd2'
         'python-debtcollector' 'python-iso8601'
         'python-keystoneauth1' 'python-monotonic' 'python-netaddr'
         'python-netifaces' 'python-neutronclient' 'python-openstackclient'
         'python-os-client-config' 'python-osc-lib' 'python-oslo-i18n'
         'python-oslo-utils' 'python-pbr' 'python-prettytable'
         'python-pyparsing' 'python-pytz' 'python-yaml' 'python-requests'
         'python-requestsexceptions' 'python-simplejson' 'python-six'
         'python-stevedore' 'python-wrapt')
checkdepends=('python-requests-mock' 'python-mock' 'python-oslotest'
              'python-stestr')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('1ac13bc13489b336b86922f547373fe446177be8d370e77dc00bcbdcdd3fdb244d8ab65077467cfcb56756dd1b2a3c44018c45ae41b67a13ce74548e98d81646')

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
