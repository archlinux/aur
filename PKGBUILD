# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
# Maintainer:  Truocolo <truocolo@aol.com>
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

_py="python2"
_pkg="pickleshare"
pkgname="${_py}-${_pkg}"
pkgver=0.7.5
pkgrel=1
pkgdesc="File system based database that uses python pickles"
url="https://github.com/${_pkg}/${_pkg}"
arch=('any')
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
_name="${pkgname#python2-}"
_pypi="https://files.pythonhosted.org/packages/source"
source=(
  "${_pypi}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
sha256sums=(
  '87683d47965c1da65cdacaf31c8441d12b8044cdec9aca500cd78fc2c683afca'
)

build() {
  cd \
    "${srcdir}/${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      build
}

package() {
  cd \
    "$srcdir/$_name-$pkgver"
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
	--optimize=1 \
	--skip-build
}

# vim:set sw=2 sts=-1 et:
