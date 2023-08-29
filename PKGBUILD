# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Jonian Guveli <https://github.com/jonian/>

_py="python2"
_pkg="apsw"
pkgname="${_py}-${_pkg}"
pkgver=3.37.0
pkgrel=1
_pkgrel="r1"
_pkgver="${pkgver}-${_pkgrel}"
pkgdesc="Python 2 wrapper for SQLite"
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h
  armv6l
)
url="https://github.com/rogerbinns/${_pkg}"
license=("GPL")
depends=("${_py}" "sqlite")
makedepends=("${_py}-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_pkgver}.tar.gz")
sha256sums=(
  "594c73a1395e5e7294424c912e1c2c64314a072debb62025f8928d53f6b1503b"
)

build() {
  cd "${srcdir}/${_pkg}-${_pkgver}"
  "${_py}" setup.py build
}

package() {
  cd "${srcdir}/apsw-${_pkgver}"
  ${_py} setup.py install --root="${pkgdir}/" \
                          --optimize=1 \
                          --skip-build
}

# vim:set sw=2 sts=-1 et:
