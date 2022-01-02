# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="cclib"
pkgname="python-${_name}"
pkgver=1.7.1
pkgrel=1
pkgdesc="A library for parsing and interpreting the results of computational chemistry packages."
arch=("any")
url="http://cclib.github.io"
license=("BSD-3-Clause")
makedepends=("python-setuptools")
depends=("python-numpy" "python-packaging" "python-periodictable" "python-scipy")
optdepends=('python-openbabel: for generating `OBMol`s of results'
            'python-biopython: for generating `BioPython.Atom`s of parsed results'
            'python-pandas: for generating DataFrames of parsed results')
source=("https://github.com/${_name}/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('eaf351db14aeba60708b42f7cfa7d2164b93bf6de259d8e224a469065e139564')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
