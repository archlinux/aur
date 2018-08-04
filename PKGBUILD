# Maintainer: Yunhui Fu <yhfudev at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: zarra <zarraxx@gmail.com>
pkgname=pygccxml
pkgver=1.9.1
pkgrel=1
pkgdesc="Simple framework to navigate C++ declarations, using Python classes."
arch=('i686' 'x86_64')
url="https://github.com/gccxml/pygccxml"
license=('custom')
depends=('gccxml-git' 'python2')
options=(!strip)

source=("https://github.com/gccxml/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2fb4e18f7a3ae039a05230ca58f11e1fc925c8643f926a1be481bb4338414a95')

build() {
  cd "${srcdir}/pygccxml-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/pygccxml-${pkgver}"
  python2 setup.py install --prefix=/usr --root=$pkgdir
}
