# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pyro-ppl
_pypiname=${pkgname/python-/}
pkgver=1.8.4
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
source=("https://files.pythonhosted.org/packages/c0/af/f653e545519597d6c833136e88aae5d8bb81969cf83c6f3d2c34f0269456/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('766fad61e52df48885de96d41213da1f8e8c1b79ecf308ad53189fcd15c1cb41')

build() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

