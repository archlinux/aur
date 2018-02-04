# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
_pythonmod=termstyle
pkgname='python2-termstyle'
pkgver='0.1.11'
pkgrel='1'
pkgdesc='console colouring for python'
arch=('any')
url='https://github.com/timbertson/termstyle'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')

source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
sha1sums=('1986f63f4a01b7c80fde3fd985643cfac7b2ee33')

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
