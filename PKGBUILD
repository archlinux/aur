# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pyro-ppl
_pypiname=${pkgname/python-/}
pkgver=1.8.0
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
source=("https://files.pythonhosted.org/packages/4c/bd/658eaf515f65905f1e63364917e98ce50bb3e53c8c6c125eea0e015206ee/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('68e4ea30f219227dd88e55de2550d3f8c20a20adbdb67ad1e13b50868bb2ac0c')

build() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

