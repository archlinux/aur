# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>
# Contributor: phijor <mail [at] phijor [dot] me>

_name=Mopidy-Iris
pkgname=mopidy-iris
pkgver=3.67.0
pkgrel=1
pkgdesc='A Mopidy Web client that utilizes the Spotify and EchoNest frameworks. (Formerly Spotmop)'
arch=('any')
url="https://github.com/jaedb/iris"
license=('APACHE')
depends=('mopidy>=3' 'python-pykka>=2.0.1' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('mopidy-local: local library support'
            'mopidy-spotify: spotify support')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b06e39ea4f80d84e0f62f632f01c8aaec8842c75095f5ea5c066138a70f4de4e')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
