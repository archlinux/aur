# Maintainer: Matthew Sexton <mssxtn@gmail.com>

pkgname=python-curl-cffi
_name=curl_cffi
pkgver=0.5.10
pkgrel=1
pkgdesc="Python binding for curl-impersonate via CFFI"
arch=('any')
url="https://github.com/yifeikong/curl_cffi"
license=('GPL3')
depends=( 'python-gevent' 'python-eventlet' 'libcurl-impersonate-chrome' 'python-cffi')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' )
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('55bac4b73e2d80ceeaabea33270fc8ca6ace594128a46710242f2e688b4f8bfc')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
