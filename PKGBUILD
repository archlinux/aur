pkgname=python-flask-profiler
pkgver=1.8.1
pkgrel=1
pkgdesc='API endpoint profiler for Flask applications'
arch=('any')
url='https://github.com/muatik/flask-profiler'
license=('MIT')

depends=(
  'python'
  'python-flask'
  'python-flask-httpauth'
  'python-simplejson'
)

makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

optdepends=(
  'python-sqlalchemy: SQLAlchemy storage backend'
  'python-pymongo: MongoDB storage backend'
)

source=("https://files.pythonhosted.org/packages/source/f/flask_profiler/flask_profiler-${pkgver}.tar.gz")
sha256sums=('fc9f2875a4f22223ddc04ffacd75792854162c4cdbef165598a51f898521ac51')

build() {
  cd "flask_profiler-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "flask_profiler-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
