# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-osc-placement
pkgver=3.2.0
pkgrel=1
pkgdesc='OpenStackClient plugin for the Placement service'
arch=('any')
url="http://docs.openstack.org/osc-placement"
license=('Apache')
depends=('python-pbr' 'python-six' 'python-keystoneauth1'
         'python-osc-lib')
checkdepends=('python-oslotest' 'python-openstackclient' 'python-stestr'
              'python-wsgi-intercept')
source=("https://github.com/openstack/osc-placement/archive/$pkgver.tar.gz")
sha512sums=('95a5b3004671b4ea541b0b2a923779a0820e8fe89757977b05d1c30857066d93f873856110a529cdedd21eec4484cbc4e800b9a5dcabd670059a6f111d9e1dbe')

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
