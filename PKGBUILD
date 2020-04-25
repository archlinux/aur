# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-ironicclient
pkgver='4.1.0'
pkgrel='1'
pkgdesc='Python client library for Ironic'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-six' 'python-requests' 'python-yaml'
         'python-openstackclient' 'python-prettytable' 'python-oslo-utils'
         'python-oslo-serialization' 'python-oslo-i18n' 'python-osc-lib'
         'python-keystoneauth1' 'python-jsonschema' 'python-dogpile.cache'
         'python-appdirs' 'python-pbr')
checkdepends=('python-fixtures' 'python-requests-mock' 'python-mock'
              'python-babel' 'python-oslotest' 'python-testtools' 'python-tempest'
              'python-stestr' 'python-ddt' 'python-openstackclient')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('a2d664972730fb32d02c6407d188ab8d950c8e3af72214499b753625c0bb485f69cc0789693f6be4feae189312819ff4a81ac4fcd59a93e8dbd45b3181dc5ed2')

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
