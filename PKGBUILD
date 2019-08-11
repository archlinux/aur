# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-octaviaclient
pkgver='1.9.0'
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
sha512sums=('e9956293d52d7c0526248982744cdd011b0b03920877bfb1178612c6fd6672c197850a6e352308e341f6c88e1b4887eae4fb16986cbe8f966efba3f60bf970c4')

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
