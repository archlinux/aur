# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: zarra <zarraxx@gmail.com>
pkgname=pygccxml
pkgver=1.7.4
pkgrel=1
pkgdesc="Simple framework to navigate C++ declarations, using Python classes."
arch=('i686' 'x86_64')
url="https://github.com/gccxml/pygccxml"
license=('custom')
depends=('gccxml-git' 'python2')
options=(!strip)

source=("https://github.com/gccxml/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5f5ea231e2661b99588ac5cd413d1be11684bb8601b8df1483078d2f64a3ee25')

build() {
  cd "${srcdir}/pygccxml-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/pygccxml-${pkgver}"
  python2 setup.py install --prefix=/usr --root=$pkgdir
}
