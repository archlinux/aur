_pipname=Flask-Session
pkgname=python-flask-session
pkgver=0.5.0
pkgrel=1
pkgdesc='Server side session extension for Flask'
arch=(any)
url='https://pypi.org/project/Flask-Session/'
license=(BSD)
depends=(python-flask python-cachelib)
makedepends=(python-build python-flit-core python-installer)
source=("https://pypi.io/packages/source/f/flask-session/Flask-Session-${pkgver}.tar.gz")
sha256sums=('190875e6aebf2953c6803d42379ef3b934bc209ef8ef006f97aecb08f5aaeb86')

build() {
  cd "$srcdir/${_pipname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {

  cd "$srcdir/${_pipname}-${pkgver}/"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
