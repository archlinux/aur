# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pyro-ppl
_pypiname=${pkgname/python-/}
pkgver=1.2.1
pkgrel=1
pkgdesc="A Python library for probabilistic modeling and inference"
arch=('any')
url="http://pyro.ai/"
license=('Apache 2.0')
depends=('python' 'python-numpy' 'python-opt_einsum' 'python-pyro-api' 'python-pytorch-cuda'
  'python-tqdm')
optdepends=('flake8' 'python-isort' 'jupyter-nbformat' 'python-nbsphinx' 'python-nbstripout'
  'ninja' 'python-pypandoc' 'python-pytest-xdist' 'jupyter' 'graphviz' 'python-matplotlib'
  'python-sphinx' 'python-sphinx_rtd_theme' 'yapf' 'python-pillow-simd' 'python-torchvision'
  'python-visdom' 'python-pandas' 'python-seaborn' 'python-wget' 'python-prettytable'
  'python-pytest-benchmark' 'python-snakeviz')
checkdepends=('python-nbval' 'python-pytest-cov' 'python-pytest' 'python-scipy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/16/6a/a33f206fe1fee706dd2fd17713dfc98148c0c7d9f72bd7cb9cd67b918c72/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('2abc8d212097c3f1d84aaa9ec46d9cbf3a9a20974d73d326146d166a10d99d1b')

build() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

