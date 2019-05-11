# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-octaviaclient
pkgver=1.8.0
pkgrel=2
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
sha512sums=('6ee8d6e252f2ff83a00ce243261e227b194fc873320ce81e91be769580918c01f05566fc2a8d290f4a9070514ba1138721566b48a2cb484b87f60de520efce26')

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
