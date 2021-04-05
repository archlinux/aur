# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pyro-api
_pypiname=${pkgname/python-/}
pkgver=0.1.2
pkgrel=1
pkgdesc="Generic API for dispatch to Pyro backends."
arch=('any')
url="http://pyro.ai/"
license=('MIT')
depends=('python')
optdepends=('flake8' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-pytest' 'ipython')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/25/d7/a0812f5c16b0d4464f80a64a44626c5fe200098070be0f32436dbb662775/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('a1b900d9580aa1c2fab3b123ab7ff33413744da7c5f440bd4aadc4d40d14d920')

build() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

