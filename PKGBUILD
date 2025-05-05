# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>
# Contributor: phijor <mail [at] phijor [dot] me>

_name=mopidy_iris
pkgname=mopidy-iris
pkgver=3.70.0
pkgrel=1
pkgdesc='A web-based frontend for Mopidy'
arch=('any')
url="https://github.com/jaedb/iris"
license=('Apache-2.0')
depends=('mopidy>=3' 'python' 'python-pykka>=2.0.1' 'python-setuptools' 'python-tornado')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('mopidy-local: local library support'
            'mopidy-spotify: spotify support')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('99dff56e54d3b6388001bfe388b13611f8929485301206bc53b3a2b8a6b8eba9')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
