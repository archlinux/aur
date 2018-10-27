# Maintainer: Michael Helmling <michaelhelmling@posteo.de>

pkgname=python2-pytaglib
pkgver=1.4.4
pkgrel=1
pkgdesc="Python bindigs for the TagLib audio metadata library (Python 2 version)"
arch=('i686' 'x86_64')
url="https://pypi.org/project/pytaglib/"
license=('GPL3')
makedepends=('python2-setuptools' 'taglib')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/66/ac/aea033ff78cd6addca7921afd52ecad62cf4c8a6a7217209dc077229b83f/pytaglib-1.4.4.tar.gz")
md5sums=('932bc5dbedcda6fd4350ed2949d20c4e')

build() {
  cd "$srcdir/pytaglib-$pkgver"
  python2 setup.py build
}

package() {
  depends=('python' 'taglib')
  cd "$srcdir/pytaglib-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
