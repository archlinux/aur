# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-osc-placement
pkgver=4.2.0
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
sha512sums=('e6b33dcaf39250321fb2321c9f7bf4f9823574ac9cdaadea6cba2013b7ede99fe128f3b04302cd85776b031d386efd91d93e04bde407d58c3286d9d3eb46e0c3')

export PBR_VERSION=$pkgver

build() {
  cd osc-placement
  python setup.py build
}

check() {
  cd osc-placement
  stestr run
}

package() {
  cd osc-placement
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
