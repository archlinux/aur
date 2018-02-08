# Maintainer: j605

_pkgname="jupyter_kernel_gateway"
pkgname="python-$_pkgname"
pkgver=2.0.2
pkgrel=1
pkgdesc="A web server for spawning and communicating with Jupyter kernels"
arch=('any')
license=('BSD')
url="https://github.com/jupyter/${_pkgname/jupyter_/}"
makedepends=('python')
depends=('python' 'python-jupyter_core' 'python-jupyter_client' 'jupyter-notebook'
'python-traitlets' 'python-tornado' 'python-requests')
source=("https://pypi.python.org/packages/a9/e5/34b171dec6a1172c8358717c76ecd9dd1fb154c44c73e05f10697491d01b/$_pkgname-$pkgver.tar.gz")
md5sums=("de5435b1f865f357385ec15a3ab989ab")

package() {
  cd $_pkgname-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}"

  install -Dm 644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
