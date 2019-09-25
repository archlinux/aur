# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-osc-placement
pkgver='1.7.0'
pkgrel='1'
pkgdesc='OpenStackClient plugin for the Placement service'
arch=('any')
url="http://docs.openstack.org/osc-placement"
license=('Apache')
depends=('python-pbr' 'python-six' 'python-keystoneauth1'
         'python-osc-lib')
checkdepends=('python-oslotest' 'python-openstackclient' 'python-stestr'
              'python-wsgi-intercept')
source=("https://github.com/openstack/osc-placement/archive/$pkgver.tar.gz")
sha512sums=('42e2d1101c4ba15d7ca41a19bcb959715ce172d02bdb9dfc0fcf50f15a6fe667ffb90c2ab4e1775443b2b41573c4060cdbc634ebe5c64d68321d37c9753e66cb')

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
