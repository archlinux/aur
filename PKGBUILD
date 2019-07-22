# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python2-subliminal
_name=${pkgname#python2-}
pkgver=2.0.5
pkgrel=1
pkgdesc="Python module to parse metadata in video files."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=(LGPL)
depends=(python2)
makedepends=(python2-distribute)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('56bc0e87496d5bc361430c4ee396b20374da697014203bdc4dda12341918e67c98aec579e44bd467898dbbf11f31e9de47ece17a0d78339f2bc700e3e6c8dd40')

package() {
  cd "${srcdir}/subliminal-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/subliminal" "${pkgdir}/usr/bin/python2-subliminal"
}
