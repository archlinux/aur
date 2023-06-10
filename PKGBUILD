# Maintainer: Swix <spam@antoine-roux.fr>

pkgname=python-cyborgclient
pkgver=2.1.0
pkgrel=1
pkgdesc="OpenStack Acceleration (Cyborg) Client"
arch=('any')
url="https://docs.openstack.org/python-cyborgclient/latest/"
license=('Apache')
depends=('python-pbr' 'python-cliff' 'python-debtcollector'
         'python-osc-lib' 'python-oslo-i18n' 'python-oslo-log' 'python-oslo-serialization'
         'python-oslo-utils' 'python-os-client-config' 'python-keystoneauth1'
         'python-keystoneclient' 'python-requests' 'python-simplejson')
checkdepends=('python-oslotest' 'python-osprofiler' 'python-requests-mock')
source=("https://github.com/openstack/python-cyborgclient/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('3f6dea2066e2920ed8bcd619a2e63cf7a6c6fa0b881907c7dff9e62140528778c09872c49e21ae10877670de5b31965d84f7bd19c221cb96ede48a5497117ba5')

export PBR_VERSION=$pkgver

build() {
  cd python-cyborgclient-$pkgver
  python setup.py build
}

package() {
  cd python-cyborgclient-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
