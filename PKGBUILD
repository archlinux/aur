# Maintainer: Spyros Stathopoulos <spystath@gmail.com>

pkgname=python2-boltons
_pkgname=boltons
pkgver=23.0.0
pkgrel=1
pkgdesc="Constructs/recipes/snippets that would be handy in the python standard library"
arch=('any')
url="https://github.com/mahmoud/boltons"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://github.com/mahmoud/${_pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('a87f3e7acec9900a1f95a478f4376f43397adddc')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
