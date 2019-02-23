# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>

pkgname=python2-boltons
_pkgname=boltons
pkgver=19.0.0
pkgrel=1
pkgdesc="Constructs/recipes/snippets that would be handy in the python standard library"
arch=('any')
url="https://github.com/mahmoud/boltons"
license=('BSD')
depends=('python')
source=("https://github.com/mahmoud/${_pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('65d179d69c3d9b4acf9de55ec57492de62c1984a')

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
