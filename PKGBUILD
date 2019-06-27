# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Julian Mehne <julian (dot) mehne (at) posteo (dot) de>
# Contributor: renyuneyun <renyuneyun (at) gmail (dot) com>

_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=0.31.1
pkgrel=1
pkgdesc="A Jupyter kernel for Octave"
arch=('any')
url="https://github.com/Calysto/octave_kernel"
license=('BSD')
depends=('jupyter' 'jupyter-metakernel' 'jupyter-notebook' 'octave')
makedepends=('python-pip')
optdepends=('gnuplot: for making plots' 'jupyterlab: JupyterLab computational environment')
source=("https://github.com/Calysto/octave_kernel/archive/v${pkgver}.tar.gz")
sha256sums=('b1aa363d3d3858da9c6c7813123de5ce5a9a78aedb4ce872169bb48eb7aedb1d')

build() {
  cd "$srcdir"/$_name-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/$_name-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}