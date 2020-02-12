# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="cclib"
pkgname="python-${_name}"
pkgver=1.6.2
pkgrel=2
pkgdesc="A library for parsing and interpreting the results of computational chemistry packages."
arch=("any")
url="http://cclib.github.io"
license=("BSD-3-Clause")
makedepends=("python-setuptools")
depends=("python-numpy" "python-packaging" "python-periodictable")
optdepends=('python-openbabel: for generating `OBMol`s of results'
            'python-biopython: for generating `BioPython.Atom`s of parsed results'
            'python-pandas: for generating DataFrames of parsed results'
            'python-scipy: for calculating properties of nuclear configurations')
source=("https://github.com/${_name}/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('ece7b34a487f7483763ef997fa527b8a8c3e1963796df0a9dbf3bab85a686338')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
