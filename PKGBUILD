# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>

pkgname=python2-boltons
_pkgname=boltons
pkgver=19.1.0
pkgrel=1
pkgdesc="Constructs/recipes/snippets that would be handy in the python standard library"
arch=('any')
url="https://github.com/mahmoud/boltons"
license=('BSD')
depends=('python')
source=("https://github.com/mahmoud/${_pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('feb8a695b83cd8da9f74695b83795b5b58ea2418')

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
