# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Tommy Li <ttoo74@gmail.com>
# Contributor: Mark Lee <mark at markelee dot com>

pkgname=jupyterhub
pkgver=1.1.0
pkgrel=1
pkgdesc="Multi-user server for Jupyter notebooks "
url="https://jupyter.org/hub"
arch=(any)
license=('BSD')
depends=('ipython' 'nodejs-configurable-http-proxy'
         'python-alembic' 'python-async_generator' 'python-certipy' 'python-entrypoints' 'python-jinja' 'python-jupyter_telemetry' 'python-jsonschema'
         'python-json-logger' 'python-oauthlib' 'python-pamela' 'python-prometheus_client' 'python-requests' 'python-sqlalchemy' 'python-tornado')
makedepends=('bower' 'npm')
optdepends=('jupyterlab')
source=("https://github.com/jupyterhub/jupyterhub/archive/${pkgver}.tar.gz")
sha256sums=('e5f70bf02d0500accdc2c25b33de037bb8be9957d1d95473ea8958b5806906b6')

build() {
  cd "${srcdir}/jupyterhub-$pkgver"
  python setup.py build
} 

package() {
  cd "${srcdir}/jupyterhub-$pkgver"
  python setup.py install --root="${pkgdir}"
  install -Dm644 COPYING.md "${pkgdir}"/usr/share/licenses/$pkgname/COPYING.md
}

