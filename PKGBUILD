# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>
# Contributor: phijor <mail [at] phijor [dot] me>

_name=Mopidy-Iris
pkgname=mopidy-iris
pkgver=3.69.2
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
sha256sums=('2b17acb83486a2086ebe864573a572ce7985c412a97c83b1c0e6389107cf55ac')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
