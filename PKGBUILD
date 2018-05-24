# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

pkgname=python2-cashew
_name=${pkgname#python2-}
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
provides=("${_name}")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/dexy/cashew/master/LICENSE")
sha256sums=('b75095f0b13547cb39db8897f535c26a2859bd8152bd704d545ba72546ea9fda'
            '87159e27fa3f901ea96b5ca028c1695c531bdbadfd4cd8aee37661ca9d28bfb8')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 ${srcdir}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
