# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pyro-ppl
_pypiname=${pkgname/python-/}
pkgver=1.7.0
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
source=("https://files.pythonhosted.org/packages/e1/b5/c9d13a46363102fc4da386ddb3f3006b991dadf3301d392e1b12c823db0b/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('a8ec6968fdfa34f140584b266099238f1ffeacbbaab3775de5c94c0e685d018a')

build() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

