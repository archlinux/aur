# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Malkov Fyodor aka krox <iksut@yandex.ru>

pkgname=python2-djvulibre
_pkgname=python-djvulibre
pkgver=0.8.3
pkgrel=1
pkgdesc="A set of Python2 bindings for the DjVuLibre library"
arch=('i686' 'x86_64')
url="http://jwilk.net/software/python-djvulibre"
license=('GPL2')
depends=('djvulibre' 'python2')
makedepends=('cython2')
source=("https://pypi.io/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('54f878969a5eb4e7c9b33b092e2e40545988a409bd2a4e7a99df042281d99af4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i "s/'python'/'python2'/" setup.py
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}

