# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pyro-api
_pypiname=${pkgname/python-/}
pkgver=0.1.1
pkgrel=1
pkgdesc="Generic API for dispatch to Pyro backends."
arch=('any')
url="http://pyro.ai/"
license=('MIT')
depends=('python')
optdepends=('flake8' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-pytest' 'ipython')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/ea/33/74c3b62306a0c496208038a7f573d4dbe12f74c1db91ca96b5a055020bb9/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('bf3942773a9982908e907d2bbc70a27bd3f5bc3eb7c7b6a8db5bb81bcc3d0d66')

build() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

