# Maintainer: Felix Höffken <fupduck at sacknagel dot com>
# Contributor: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=soledad
pkgname=python2-leap_$_srcname
replaces=("python2-leap_${_srcname}_common" "python2-leap_${_srcname}_client")
pkgver=0.10.4
pkgrel=1
pkgdesc='Synchronization Of Locally Encrypted Data Among Devices.'
arch=('any')
url='https://bitmask.net/'
license=('GPL3')
depends=(
  'python2-leap_pycommon'
  'python2-paste'
  'python2-routes'
  'python2-six'
  'python2-twisted'
  'python2-treq'
  'python2-scrypt'
  'python2-zope-proxy'
  'python2-cryptography'
  'python2-pysqlcipher'
  'python2-configparser'
  'python2-beaker'
  'python2-couchdb'
)
#checkdepends=(
#  'python2-tox'
#)
source=("https://0xacab.org/leap/$_srcname/repository/$pkgver/archive.tar.gz")
sha512sums=('05442786570c96a231b4b5228d6145d9739132d8fe22fd9b5ddb6eb5ec30c081f890a28912e1ea79395c363cfec8607a9004af558bc36829079e8d10395ed679')
noextract=("archive.tar.gz")

prepare() {
 mkdir "${srcdir}/$_srcname-$pkgver" && tar xvfz archive.tar.gz -C "${srcdir}/$_srcname-$pkgver/" --strip-components 1
}

build() {
  cd "${srcdir}/$_srcname-$pkgver/"
  python2 setup.py build
}

package_python2-leap_soledad () {

  cd "${srcdir}/$_srcname-$pkgver/"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
