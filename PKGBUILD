# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Infernio <infernio at icloud dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_py="python2"
_pkg="pkgconfig"
pkgname="${_py}-${_pkg}"
pkgver=1.5.1
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
  '97bfe3d981bab675d5ea3ef259045d7919c93897db7d3b59d4e8593cba8d354f'
)

package() {
  cd "${_pkg}-${pkgver}"

  "${_py}" setup.py install --prefix=/usr \
                            --root="${pkgdir}" \
                            --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
