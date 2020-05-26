# Maintainer: Zachary Vance <za3k at za3k dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=fabric1
pkgver=1.14.1
pkgrel=1
pkgdesc="Python library and command-line tool designed to streamline deploying applications or performing system administration tasks via the SSH protocol"
url="https://www.fabfile.org/"
license=('BSD')
arch=('any')
depends=('python2-setuptools' 'python2-paramiko')
optdepends=()
conflicts=('fabric')
source=("https://github.com/fabric/fabric/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1daffe8875fb13b5496cbc7e8ca65185a2151a52ad9319d0cb2250432fc43092ff87b017ecd9b77f529f0104b842ec01e0fc99789e0f8b82955a44c9a150df98')

build() {
  cd "${srcdir}"/fabric-${pkgver}
  python2 setup.py build
}

package() {
  cd "${srcdir}"/fabric-${pkgver}
  python2 setup.py install -O1 --skip-build --root="${pkgdir}"

  install -Dm644 README.rst "${pkgdir}"/usr/share/doc/${pkgname}/README.rst
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
