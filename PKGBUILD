
pkgname=jupyterhub
pkgver=0.1.0
pkgrel=1
pkgdesc="Multi-user server for Jupyter notebooks "
url="http://jupyter.org/"
arch=(any)
license=('BSD')
depends=('ipython-notebook' 'python-jinja' 'python3-simplepam' 'python-sqlalchemy' 'python-requests' 'nodejs-configurable-http-proxy')
makedepends=('nodejs-bower')
source=("https://github.com/jupyter/jupyterhub/archive/${pkgver}.tar.gz")
md5sums=('17cf693de2dfca7c8a94b163ed57349f')

build() {
  cd "${srcdir}/jupyterhub-$pkgver"
  python setup.py build
} 

package() {
  cd "${srcdir}/jupyterhub-$pkgver"
  python setup.py install --root="${pkgdir}"
  install -Dm644 COPYING.md "${pkgdir}"/usr/share/licenses/$pkgname/COPYING.md
}

