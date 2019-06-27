# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: renyuneyun <renyuneyun (at) gmail (dot) com>

_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=0.31.0
pkgrel=1
pkgdesc="A Jupyter kernel for Octave"
arch=('any')
url="https://github.com/Calysto/octave_kernel"
license=('BSD')
depends=('jupyter' 'jupyter-metakernel' 'jupyter-notebook' 'octave')
makedepends=('python-pip')
optdepends=('gnuplot: for making plots' 'jupyterlab: JupyterLab computational environment')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/${_name}/${_name/-/_}-${pkgver}-py3-none-any.whl")
sha256sums=('3bec024eed29105af73f6110bb12c8aa6146415743606c91f1b91547a35f4b7c')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}