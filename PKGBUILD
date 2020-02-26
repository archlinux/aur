# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément DEMOULINS <clement@archivel.fr>

pkgname=python2-networkx
pkgver=2.2
pkgrel=3
pkgdesc='Python 2 package for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks.'
arch=(any)
license=(BSD)
url="https://networkx.github.io"
depends=(python2-decorator)
makedepends=(python2-setuptools)
optdepends=('python2-numpy: Provides sparse matrix representation of graphs and many numerical scientific tools'
            'python2-scipy: Provides flexible drawing of graphs'
            'python2-pydot: Provides graph drawing and graph layout algorithms'
            'python2-pyparsing: Required for pydot, GML file reading'
            'python2-yaml: Required for YAML format reading and writing')
source=("https://github.com/networkx/networkx/archive/networkx-$pkgver.tar.gz")
sha256sums=('74efce06507cdc2e506c6b7d485a18617adc3a7f355e2dc48ca71c83929bc679')

build() {
  cd networkx-networkx-$pkgver
  python2 setup.py build
}

package() {
  cd networkx-networkx-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  mv "$pkgdir"/usr/share/doc/networkx-$pkgver "$pkgdir"/usr/share/doc/$pkgname
}
