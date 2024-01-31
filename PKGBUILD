# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

_py="python2"
_pkg="defusedxml"
pkgname="${_py}-${_pkg}"
pkgver=0.7.1
pkgrel=5
pkgdesc="XML bomb protection for Python stdlib modules"
arch=(
  'any'
)
url='https://github.com/tiran/defusedxml'
license=(
  'Python')
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
source=(
  "https://pypi.io/packages/source/d/defusedxml/defusedxml-$pkgver.tar.gz")
sha512sums=(
  '93c1e077b22a278011497f3b3f4409b5259e0077768caa121e0f078f80f39c082f3870eaaf4bad5166fe8c3b2d169ccdea62c2840ba6969240a8371cef34c4d5')

package() {
  cd "${_pkg}-${pkgver}"
  "${_py}" setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set sw=2 sts=-1 et:
