# Maintainer:

pkgname=python-webtest-aiohttp
pkgver=2.0.0
pkgrel=1
pkgdesc='Provides integration of WebTest with aiohttp.web applications'
arch=(any)
url='https://github.com/sloria/webtest-aiohttp'
license=(MIT)
depends=(python)
makedepends=(python-pip python-build python-installer python-wheel)
checkdepends=(python-pytest)
_name=${pkgname/python-/}
source=(https://pypi.python.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('58e2a2f13078c3f1f23ccebef03de4d6d118d096cd6e9d0d190e359d9ffb11f8')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
