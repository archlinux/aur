# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Infernio <infernio at icloud dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_py="python2"
_pkg="pkgconfig"
pkgname="${_py}-${_pkg}"
pkgver=1.5.5
pkgrel=1
pkgdesc="Python 2 module to interface with the pkg-config command line tool"
arch=(any)
_ns="matze"
url="https://github.com/${_ns}/${_pkg}"
license=(MIT)
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
_pypi_url="https://files.pythonhosted.org/packages/source"
source=(
  "${_pypi_url}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
sha256sums=(
  'deb4163ef11f75b520d822d9505c1f462761b4309b1bb713d08689759ea8b899'
)

package() {
  cd "${_pkg}-${pkgver}"

  "${_py}" setup.py install --prefix=/usr \
                            --root="${pkgdir}" \
                            --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
