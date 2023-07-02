# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-osc-placement
pkgver=4.1.0
pkgrel=1
pkgdesc='OpenStackClient plugin for the Placement service'
arch=('any')
url="http://docs.openstack.org/osc-placement"
license=('Apache')
depends=('python-pbr' 'python-six' 'python-keystoneauth1'
         'python-osc-lib')
checkdepends=('python-oslotest' 'python-openstackclient' 'python-stestr'
              'python-wsgi-intercept')
source=("https://opendev.org/openstack/osc-placement/archive/$pkgver.tar.gz")
sha512sums=('2bf949f0be6c3b84288b992c09c722b2875e3419a0f74bffb7d17e2fa9093483d0c8b116cfb95fb3fd1ef296790e4aeebd1c5bda34a5824bbf8b9f812a409f4c')

export PBR_VERSION=$pkgver

build() {
  cd osc-placement-$pkgver
  python setup.py build
}

check() {
  cd osc-placement-$pkgver
  stestr run
}

package() {
  cd osc-placement-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
