# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="basis_set_exchange"
pkgname="python-${_name}"
pkgver=0.8.12
pkgrel=1
pkgdesc="A repository for quantum chemistry basis sets"
arch=("any")
url="https://molssi-bse.github.io/basis_set_exchange/"
license=("BSD-3-Clause")
depends=("python-argcomplete" "python-graphviz" "python-jsonschema")
makedepends=("python-setuptools")
source=("https://github.com/MolSSI-BSE/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('41f0242e2c11392c511d3308c0345e14b0eb3344686d865bdfcb48257910fc0d')

build() {
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
