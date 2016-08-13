# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Malkov Fyodor aka krox <iksut@yandex.ru>

pkgname=python2-djvulibre
_pkgname=python-djvulibre
pkgver=0.8
pkgrel=2
pkgdesc="A set of Python2 bindings for the DjVuLibre library"
arch=('i686' 'x86_64')
url="http://jwilk.net/software/python-djvulibre"
license=('GPL2')
depends=('djvulibre' 'python2')
makedepends=('cython2')
source=("https://pypi.io/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9d6bf3143fa540e8ce330949c9edff7847ad7cd715f7c02e2991212873a5f31b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i "s/'python'/'python2'/" setup.py
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}

