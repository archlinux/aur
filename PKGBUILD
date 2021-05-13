# Maintainer: Spyros Stathopoulos <spystath@gmail.com>

pkgname=python2-boltons
_pkgname=boltons
pkgver=20.0.0
pkgrel=1
pkgdesc="Constructs/recipes/snippets that would be handy in the python standard library"
arch=('any')
url="https://github.com/mahmoud/boltons"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://github.com/mahmoud/${_pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('007de7cd9b1f11fc70089f494e683be7b266927d')

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
