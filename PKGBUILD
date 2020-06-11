# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Julian Mehne <julian (dot) mehne (at) posteo (dot) de>
# Contributor: renyuneyun <renyuneyun (at) gmail (dot) com>

_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=0.32.0
pkgrel=2
pkgdesc="A Jupyter kernel for Octave"
arch=('any')
url="https://github.com/Calysto/octave_kernel"
license=('BSD')
depends=('jupyter' 'jupyter-metakernel>=0.24.2' 'jupyter-notebook' 'octave')
makedepends=('python-pip')
optdepends=('gnuplot: for making plots' 'jupyterlab: JupyterLab computational environment')
source=("https://github.com/Calysto/octave_kernel/archive/${pkgver}.tar.gz")
sha256sums=('b33a92b8f4e18bb9b707b827f21cccfcb2d0d9a7c3d6c121b70184bc1bd55190')

build() {
  cd "$srcdir"/$_name-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/$_name-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
