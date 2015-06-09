# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>

pkgname=python2-boltons
_pkgname=boltons
pkgver=0.6.4
pkgrel=1
pkgdesc="Constructs/recipes/snippets that would be handy in the python standard library"
arch=('any')
url="https://github.com/mahmoud/boltons"
license=('BSD')
depends=('python2')
source=("https://github.com/mahmoud/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('8d85f93cfe68d68731a8cf23faf8e62e')

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
