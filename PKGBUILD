# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pyro-ppl
_pypiname=${pkgname/python-/}
pkgver=1.9.1
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
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/pyro_ppl-${pkgver}.tar.gz")
sha256sums=('5e1596de276c038a3f77d2580a90d0a97126e0104900444a088eee620bb0d65e')

build() {
  cd $srcdir/pyro_ppl-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/pyro_ppl-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

