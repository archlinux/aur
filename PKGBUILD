# Maintainer: Kye Hunter <kye(dot)evan(dot)hunter(at)gmail(dot)com>

_name=rdata
pkgname=python-rdata
#_pkgname=${pkgname%%-git}
pkgver=1.1.0
#pkgver() {
#    sed -nr '/version/s/^.*="(.*)".*$/\1/p' ${srcdir}/${_name}/setup.py
#}
pkgrel=1
pkgdesc="A Python library for R datasets."
arch=(any)
url="https://github.com/vnmabus/rdata"
license=('MIT')
depends=(
    'python-numpy'
	  'python-xarray'
	  'python-pandas'
	  #'python-typing_extensions'
)
makedepends=(
    'python-setuptools'
)
#provides=(
#    $_pkgname
#)
#conflicts=(
#    $_pkgname
#)
source=('git+https://github.com/vnmabus/rdata.git')
sha256sums=('SKIP')

build() {
  cd $srcdir/$_name
  python -m build 
}

package() {
  cd $srcdir/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  #install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

