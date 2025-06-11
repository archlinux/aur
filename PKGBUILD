# Maintainer: envolution
# Contributor: NOGISAKA Sadata <ngsksdt@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-mecab
_pkgname=mecab_python3
pkgver=1.0.10
pkgrel=2
pkgdesc="Morphological Analysis Tool - Python3 interface"
arch=('x86_64' 'i686')
url="https://github.com/SamuraiT/mecab-python3"
license=('BSD-3-Clause' 'LGPL-2.1-only' 'GPL-2.0-only')
depends=('python' 'mecab' 'mecab-ipadic')
makedepends=('python-build' 'python-setuptools' 'python-setuptools-scm' 'python-wheel' 'python-installer' 'python-pip' 'swig')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha1sums=('34284cce5662667a4610131ae1a6266391134730')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir=${pkgdir} dist/*.whl
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
# vim:set ts=2 sw=2 et:
