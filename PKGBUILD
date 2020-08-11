# Maintainer: Michael Helmling <michaelhelmling@posteo.de>

pkgname=python2-pytaglib
pkgver=1.4.5
pkgrel=1
pkgdesc="Python bindigs for the TagLib audio metadata library (Python 2 version)"
arch=('i686' 'x86_64')
url="https://pypi.org/project/pytaglib/"
license=('GPL3')
makedepends=('python2-setuptools' 'taglib')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/c7/44/f054737af93d8bc57c3a23906e4e7d1b5538c7d96577746e5c4b2f92b181/pytaglib-1.4.6.tar.gz")
md5sums=('ddf326210c4ed0db9a05638191c03752')

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
