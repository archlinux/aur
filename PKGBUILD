# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-osc-placement
pkgver=3.1.1
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
sha512sums=('7769fca24e7c58a3b7310dad100a68455173326338e3258941120d35e18b3f7036afd955c8b8112a060af56bf82dd9db7c8a32728c3e093026117ff7f7c73e7a')

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
