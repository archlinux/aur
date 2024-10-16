_pipname=flask_session
pkgname=python-flask-session
pkgver=0.8.0
pkgrel=1
pkgdesc='Server side session extension for Flask'
arch=(any)
url='https://pypi.org/project/Flask-Session/'
license=(BSD)
depends=(python-flask python-cachelib)
makedepends=(python-build python-flit-core python-installer)
source=("https://pypi.io/packages/source/f/flask-session/flask_session-${pkgver}.tar.gz")
b2sums=('f8d4f66174212222047f0496295671a321eb56e8fe53abb906a60d2cc602344843819c62dc71056f0380fd91cc3811e92c2663fb6b0bd39cb8a300ee9040d1e9')

build() {
  cd "$srcdir/${_pipname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {

  cd "$srcdir/${_pipname}-${pkgver}/"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
