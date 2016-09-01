# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname='python2-termstyle'
pkgver='0.1.10'
pkgrel='1'
pkgdesc='console colouring for python'
arch=('any')
url='https://github.com/timbertson/termstyle'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')

source=("https://github.com/timbertson/termstyle/archive/${pkgver}.tar.gz")
sha1sums=('8bc0d84c08f1601303b3301acef3f492cd0626e8')

build() {
  cd "termstyle-${pkgver}"
  python2 ./setup.py build
}

check() {
  cd "termstyle-${pkgver}"
  python2 ./setup.py test
}

package() {
  cd "termstyle-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr"
}

# vim:set ts=2 sw=2 et:
