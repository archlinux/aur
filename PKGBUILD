# Maintainer: Matthew Sexton <matthew@Asylumtech.com>

pkgname=python-curl-cffi
_name=curl_cffi
pkgver=0.5.6
pkgrel=3
pkgdesc="Python binding for curl-impersonate via CFFI"
arch=('any')
url="https://github.com/yifeikong/curl_cffi"
license=('GPL3')
depends=( 'python-gevent' 'python-eventlet' 'libcurl-impersonate-chrome' 'python-cffi')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' )
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('30eea55149bd66dbb11aa467e3b4e039085bfac38da7fb8ae694425d9b7061da')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
