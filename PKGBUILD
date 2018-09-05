# Maintainer: Mark Lee <mark at markelee dot com>

pkgname=jupyterhub
pkgver=0.9.2
pkgrel=1
pkgdesc="Multi-user server for Jupyter notebooks "
url="http://jupyter.org/"
arch=(any)
license=('BSD')
depends=('python-alembic' 'python-tornado' 'python-jinja' 'ipython' 'python-pamela' 'python-sqlalchemy' 'python-requests' 'nodejs-configurable-http-proxy')
makedepends=('bower' 'npm')
source=("https://github.com/jupyter/jupyterhub/archive/${pkgver}.tar.gz")
sha256sums=("ef86512a485050dd28df9b785cb9912cbbbf69a131a34da216753af93d095da7")

build() {
  cd "${srcdir}/jupyterhub-$pkgver"
  python setup.py build
} 

package() {
  cd "${srcdir}/jupyterhub-$pkgver"
  python setup.py install --root="${pkgdir}"
  install -Dm644 COPYING.md "${pkgdir}"/usr/share/licenses/$pkgname/COPYING.md
}

