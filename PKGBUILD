# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Tommy Li <ttoo74@gmail.com>
# Contributor: Mark Lee <mark at markelee dot com>

pkgname=jupyterhub
pkgver=1.0.0
pkgrel=1
pkgdesc="Multi-user server for Jupyter notebooks "
url="https://jupyter.org/hub"
arch=(any)
license=('BSD')
depends=('python-prometheus_client' 'python-entrypoints' 'python-async_generator' 'python-oauthlib' 'python-certipy' 'python-alembic' 'python-tornado' 'python-jinja' 'ipython' 'python-pamela' 'python-sqlalchemy' 'python-requests' 'nodejs-configurable-http-proxy')
makedepends=('bower' 'npm')
optdepends=('jupyterlab')
source=("https://github.com/jupyter/jupyterhub/archive/${pkgver}.tar.gz")
sha256sums=('e985fdba1b361add5b8da1736446c7bc8c94466e1e04903233b015aa37d341f5')

build() {
  cd "${srcdir}/jupyterhub-$pkgver"
  python setup.py build
} 

package() {
  cd "${srcdir}/jupyterhub-$pkgver"
  python setup.py install --root="${pkgdir}"
  install -Dm644 COPYING.md "${pkgdir}"/usr/share/licenses/$pkgname/COPYING.md
}

