_pipname=flask_session
pkgname=python-flask-session
pkgver=0.6.0
pkgrel=1
pkgdesc='Server side session extension for Flask'
arch=(any)
url='https://pypi.org/project/Flask-Session/'
license=(BSD)
depends=(python-flask python-cachelib)
makedepends=(python-build python-flit-core python-installer)
source=("https://pypi.io/packages/source/f/flask-session/flask_session-${pkgver}.tar.gz")
sha256sums=('b1ed06cf4c5a211305579a132e81307d242cec6fe2714a276405730ffd22a034')

build() {
  cd "$srcdir/${_pipname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {

  cd "$srcdir/${_pipname}-${pkgver}/"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
