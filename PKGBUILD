# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Malkov Fyodor aka krox <iksut@yandex.ru>

pkgname=python-djvulibre
pkgver=0.6.1
pkgrel=1
pkgdesc="A set of Python bindings for the DjVuLibre library"
arch=('i686' 'x86_64')
url="http://jwilk.net/software/python-djvulibre"
license=('GPL2')
depends=('djvulibre' 'python2')
makedepends=('cython2')
source=("http://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7897d4bd828c8adba0fb6086edfa8c71be29db22187a02e8ec11e4b18398419e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s/'cython'/'cython2'/" setup.py
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
