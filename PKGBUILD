# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-muranopkgcheck
pkgver=0.3.0
pkgrel=4
pkgdesc='Murano package validator tool'
arch=('any')
url='https://docs.openstack.org/murano-pkg-check/'
license=('Apache')
depends=('python-pbr' 'python-yaml' 'python-yaql' 'python-six'
         'python-stevedore' 'python-semantic-version' 'python-oslo-i18n')
checkdepends=('python-subunit' 'python-oslotest' 'python-oslotest'
              'python-testrepository' 'python-testscenarios' 'python-testtools'
              'python-stestr' 'python-mock')
source=("https://github.com/openstack/murano-pkg-check/archive/$pkgver.tar.gz")
sha512sums=('98a08661957e09c9ee0b4f018bd874696e586d296c9233514d7f46099d02068a72185317708fd9755917ed6fb1b773d9ccad70b9fd841af59e91f7969d93b6b5')

export PBR_VERSION=$pkgver

build() {
  cd murano-pkg-check-$pkgver
  python setup.py build
}

check() {
  cd murano-pkg-check-$pkgver
  #stestr run
  python setup.py test
}

package() {
  cd murano-pkg-check-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
