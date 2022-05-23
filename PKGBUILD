# Maintainer: Zachary Vance <za3k at za3k dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=fabric1
pkgver=1.15.0
pkgrel=1
pkgdesc="Python library and command-line tool designed to streamline deploying applications or performing system administration tasks via the SSH protocol"
url="https://www.fabfile.org/"
license=('BSD')
arch=('any')
depends=('python-setuptools' 'python-paramiko')
optdepends=()
conflicts=('fabric')
source=("https://github.com/fabric/fabric/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('332ef25d7ff170b661826fd61305b706b1cdad3954f1704ef753489f6a259aef8881ea495f969c95090532cadfca12490f9eadad2219ac4ae6ca2912d6a69cb6')

build() {
  cd "${srcdir}"/fabric-${pkgver}
  python setup.py build
}

package() {
  cd "${srcdir}"/fabric-${pkgver}
  python setup.py install -O1 --skip-build --root="${pkgdir}"

  install -Dm644 README.rst "${pkgdir}"/usr/share/doc/${pkgname}/README.rst
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
