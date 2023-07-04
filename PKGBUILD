# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: qlonik <volodin.n at gmail dot com>

_py="python2"
_pkg="readlike"
pkgname="${_py}-${_pkg}"
pkgver=0.1.3
pkgrel=1
pkgdesc="GNU Readline-like line editing module"
url="http://jangler.info/code/${_pkg}"
depends=("${_py}")
makedepends=("${_py}-setuptools")
license=('MIT')
arch=('any')
_pypi_url="https://pypi.python.org/packages/source"
source=(
  "${_pypi_url}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
sha256sums=(
  '4486ba5f1c1770dc6458316ecb95ea12e1ba7f59f328804fa17a8212b743fc08'
)

build() {
    cd "${srcdir}/${_pkg}-${pkgver}"
    "${_py}" setup.py build
}

package() {
    cd "${srcdir}/${_pkg}-${pkgver}"
    "${_py}" setup.py install --root="$pkgdir" \
                              --optimize=1
    install -Dm644 LICENSE \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
