
pkgname=jupyterhub
pkgver=0.6.1
pkgrel=1
pkgdesc="Multi-user server for Jupyter notebooks "
url="http://jupyter.org/"
arch=(any)
license=('BSD')
depends=('python-alembic' 'python-tornado' 'python-jinja' 'ipython' 'python-pamela' 'python-sqlalchemy' 'python-requests' 'nodejs-configurable-http-proxy')
makedepends=('bower' 'npm')
source=("https://github.com/jupyter/jupyterhub/archive/${pkgver}.tar.gz")
md5sums=('cf3de18430795a6e1b51feb06b34e8a8')

build() {
  cd "${srcdir}/jupyterhub-$pkgver"
  python setup.py build
} 

package() {
  cd "${srcdir}/jupyterhub-$pkgver"
  python setup.py install --root="${pkgdir}"
  install -Dm644 COPYING.md "${pkgdir}"/usr/share/licenses/$pkgname/COPYING.md
}

