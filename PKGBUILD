# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-octaviaclient
pkgver=2.1.0
pkgrel=1
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
              'python-stestr' 'python-hacking')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('c65266630a9c5fe4d7b81db9f3c2b3d933c4abb403861025e7c36cff21b42346cae6e50fec3ebf70cd1297eab272148296acbc25ac9fb1927cae407a0bc671d4')

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
