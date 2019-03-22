# Maintainer: j605

_pkgname="kernel_gateway"
pkgname="python-jupyter_$_pkgname"
pkgver=2.3.0
pkgrel=1
pkgdesc="A web server for spawning and communicating with Jupyter kernels"
arch=('any')
license=('BSD')
url="https://github.com/jupyter/${_pkgname/jupyter_/}"
makedepends=('python')
depends=('python' 'python-jupyter_core' 'python-jupyter_client' 'jupyter-notebook'
'python-traitlets' 'python-tornado' 'python-requests')
source=($pkgname-$pkgver.tar.gz::"https://github.com/jupyter/kernel_gateway/archive/$pkgver.tar.gz")
sha256sums=('d6cc1d10b73a620c2990676cea3ace0cdc98a9751724287bddc7ccac0d452b97')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build

  install -Dm 644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
