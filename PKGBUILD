# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>
_pkgname=cashew
pkgname=python2-${_pkgname}
pkgver=0.2.7
pkgrel=1
pkgdesc="The plugin system used by dexy."
arch=('any')
url='http://dexy.github.io/cashew/'
license=('MIT')
depends=('python2'
         'python2-yaml'
         'python2-inflection>=0.2.0')
makedepends=('python2-setuptools')
options=(!emptydirs)
provides=("${_pkgname}")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/dexy/cashew/master/LICENSE")
md5sums=('e7a3801bf2ac92817d33292ea25efe5e'
         '7ae0144577340e245b148893690d7f37')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 ${srcdir}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
