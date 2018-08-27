# Maintainer: j605

_pkgname="jupyter_kernel_gateway"
pkgname="python-$_pkgname"
pkgver=2.1.0
pkgrel=1
pkgdesc="A web server for spawning and communicating with Jupyter kernels"
arch=('any')
license=('BSD')
url="https://github.com/jupyter/${_pkgname/jupyter_/}"
makedepends=('python')
depends=('python' 'python-jupyter_core' 'python-jupyter_client' 'jupyter-notebook'
'python-traitlets' 'python-tornado' 'python-requests')
source=("https://files.pythonhosted.org/packages/1d/b5/64a86ba0d97ff6f83385b4f3d7ae27e67fd134da6f9dc3cafe8cde031dcc/$_pkgname-$pkgver.tar.gz")
sha256sums=("7fb26c04e1cd16ddbf9184a4cb0b74e90031b72b48f1c659e22ecaa8b49a95ce")

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build

  install -Dm 644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
