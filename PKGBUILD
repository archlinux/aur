# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: zarra <zarraxx@gmail.com>
pkgname=pygccxml
pkgver=1.0.0
pkgrel=4
pkgdesc="The purpose of pygccxml is to read a generated file and provide a simple framework to navigate C++ declarations, using Python classes."
arch=('i686' 'x86_64')
url="http://www.sourceforge.net/projects/pygccxml"
license=('custom')
depends=('gccxml-git' 'python2')
options=(!strip)

source=(http://jaist.dl.sourceforge.net/sourceforge/pygccxml/pygccxml-${pkgver}.zip)
md5sums=('44badbf8c4bcd3095290a90f2f2a9234')

build() {
  cd "$srcdir/pygccxml-${pkgver}"

  python2 setup.py build
}

package() {
  cd "$srcdir/pygccxml-${pkgver}"

  python2 setup.py install --prefix=/usr --root=$pkgdir
}
