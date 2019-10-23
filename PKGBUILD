# Maintainer: alienzj <alienchuj@gmail.com>

pkgname=python-pygraphviz
pkgver=1.5
pkgrel=1
pkgdesc="Python interface to Graphviz graph drawing package"
arch=('i686' 'x86_64')
url="https://pygraphviz.github.io/"
license=('LGPL')
depends=('python' 'graphviz')
makedepends=('python-setuptools')
source=("https://github.com/pygraphviz/pygraphviz/archive/pygraphviz-1.5.tar.gz")
md5sums=('1ef3e258e0ec0d22218adcce2e32dedf')

prepare() {
  cd "$srcdir/pygraphviz-pygraphviz-1.5"
  echo "1.5"
}

build() {
  cd "$srcdir/pygraphviz-pygraphviz-1.5"
  python setup.py build
}

package() {
  cd "$srcdir/pygraphviz-pygraphviz-1.5"
  python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  mv "$pkgdir/usr/share/doc/pygraphviz-1.5" "$pkgdir/usr/share/doc/${pkgname}-1.5"
}

# vim:set ts=2 sw=2 et:
