# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python2-subliminal
_name=${pkgname#python2-}
pkgver=2.1.0
pkgrel=1
pkgdesc="Python module to parse metadata in video files."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=(LGPL)
depends=(python2)
makedepends=(python2-distribute)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('cba824329b5590856331b4b83dd753eebbb732979a826cb7e7017c176bce892d28f7fe1f237e27c3afabda113dd8967ce6772006bc9be0abe48c3ea14fe05647')

package() {
  cd "${srcdir}/subliminal-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/subliminal" "${pkgdir}/usr/bin/python2-subliminal"
}
