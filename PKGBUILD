# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pyro-ppl
_pypiname=${pkgname/python-/}
pkgver=1.9.0
pkgrel=1
pkgdesc="A Python library for probabilistic modeling and inference"
arch=('any')
url="http://pyro.ai/"
license=('Apache 2.0')
depends=('python' 'python-numpy' 'python-opt_einsum' 'python-pyro-api' 'python-pytorch'
  'python-tqdm')
optdepends=('python-pytorch-cuda' 'flake8' 'python-isort' 'jupyter-nbformat' 'python-nbsphinx' 'python-nbstripout'
  'ninja' 'python-pypandoc' 'python-pytest-xdist' 'jupyter' 'graphviz' 'python-matplotlib'
  'python-sphinx' 'python-sphinx_rtd_theme' 'yapf' 'python-pillow-simd' 'python-torchvision'
  'python-visdom' 'python-pandas' 'python-seaborn' 'python-wget' 'python-prettytable'
  'python-pytest-benchmark' 'python-snakeviz')
checkdepends=('python-nbval' 'python-pytest-cov' 'python-pytest' 'python-scipy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/95/2d/a498ef1a292935c35a7b3c83971975974a39900fac4cc43f5398212181aa/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('41f4c005159568280fbc511648960a98a2b1a410027d8bd0a43220ac9b102cdf')

build() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

