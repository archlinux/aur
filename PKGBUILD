# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-osc-placement
pkgver=4.0.0
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
sha512sums=('5b320591ef4ac189c09f209129b1a9f08a0aafa59803072b1334ad483e07fce0d5837038fbfcda1b48eacdcd7a3e8fb4d4a6fc60c082c8195cfe7691171bdd58')

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
