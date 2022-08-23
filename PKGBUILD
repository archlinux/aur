# Maintainer: Swix <spam@antoine-roux.fr>

pkgname=python-cyborgclient
pkgver=2.0.0
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
sha512sums=('92d68a91553c481941315ee76fa6cd5e76515ef47181559409cba34f9c49e4aa6ea25851b22772084dcfc8dfd64b5a4a90f8a5f3017955245408954d1cf42267')

export PBR_VERSION=$pkgver

build() {
  cd python-cyborgclient-$pkgver
  python setup.py build
}

package() {
  cd python-cyborgclient-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
