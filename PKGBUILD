# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor : vae77 <fernandogrd@yahoo.com.br>

_py="python2"
_pkg=pathlib
pkgname="${_py}-${_pkg}"
pkgver=1.0.1
pkgrel=5
_pkgdesc=("This module offers a set of classes featuring all the common "
          "operations on paths in an easy, object-oriented way")
pkgdesc="${_pkgdesc[*]}"
arch=('any')
url="https://${_pkg}.readthedocs.org/en/${pkgver}/"
license=('MIT')
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
_pypi_url="https://files.pythonhosted.org/packages/source"
source=(
  "${_pypi_url}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz")
sha512sums=(
  'd85e45dfcc85ce75a7e7b609163dc8c75c688f279c1833510185f280af5501e473376dc09bddc6a804d1fcc3177a939db85af37b7b8d5b183b9bc2b85b3b0f8b'
)

package() {
  cd "${srcdir}/${_pkg}-${pkgver}"
  "${_py}" setup.py install --root="${pkgdir}" \
                            --optimize=1
  install -Dm644 LICENSE.txt \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
