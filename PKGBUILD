# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="cclib"
pkgname="python-${_name}"
pkgver=1.8
pkgrel=1
pkgdesc="A library for parsing and interpreting the results of computational chemistry packages."
arch=("any")
url="http://cclib.github.io"
license=("BSD-3-Clause")
makedepends=("python-setuptools")
depends=("python-importlib-metadata"
         "python-packaging"
         "python-periodictable"
         "python-scipy")
optdepends=('python-openbabel: for generating `OBMol`s of results'
            'python-biopython: for generating `BioPython.Atom`s of parsed results'
            'python-pandas: for generating DataFrames of parsed results'
            'psi4: for Psi4 bridge'
            'python-ase: for ASE bridge'
            'python-h5py: for reading proatom densities from horton'
            'python-pyscf: for PySCF bridge')
source=("https://github.com/${_name}/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('8b4c4b0f43168374e7aa4e3b433f0b1d0c443dbb73562ab09e705d7c4e61c5e2')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
