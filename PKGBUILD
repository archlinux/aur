# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Malkov Fyodor aka krox <iksut@yandex.ru>

pkgname=python-djvulibre
pkgver=0.7.2
pkgrel=1
pkgdesc="A set of Python bindings for the DjVuLibre library"
arch=('i686' 'x86_64')
url="http://jwilk.net/software/python-djvulibre"
license=('GPL2')
depends=('djvulibre' 'python2')
makedepends=('cython2')
source=("https://pypi.io/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
# https://files.pythonhosted.org/packages/source/p/python-djvulibre/python-djvulibre-0.7.2.tar.gz
sha256sums=('4a2451ad965492fb4328fcfe4e79ad07ca2d8482776d34cf0f8adcb24195dc74')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s/'cython'/'cython2'/" setup.py
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
