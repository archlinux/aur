# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Jameson Pugh <imntreal@gmail.com>

_py="python2"
_pkg="semantic"
pkgname="${_py}-${_pkg}"
pkgver=1.0.3
pkgrel=2
pkgdesc='Library for extracting semantic information from text, such as dates and numbers'
url="http://packages.python.org/${_pkg}"
arch=(any)
license=(BSD)
depends=("${_py}-quantities")
_pypi_url="https://pypi.python.org/packages/source"
source=(
  "${_pypi_url}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
sha512sums=(SKIP)

build() {
  cd "${srcdir}/${_pkg}-${pkgver}"
  "${_py}" setup.py build || return 1
}

package() {
  cd "${srcdir}/${_pkg}-${pkgver}"
  "${_py}" setup.py install --prefix=/usr \
                            --root=$pkgdir || return 1
}

# vim:set sw=2 sts=-1 et:
