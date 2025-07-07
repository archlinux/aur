# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname="desiutil"
pkgname=python-desiutil
pkgver=3.5.2
pkgrel=1
pkgdesc="General purpose tools for DESI pipeline"
arch=(any)
url="https://github.com/desihub/desiutil"
license=('custom')
depends=('python-setuptools' 'python-requests' 'python-pyyaml' 'python-astropy'
         'python-healpy' 'python-matplotlib')

source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('eb375a47133ab47999c0d94078e729e8cf045034d0647e63c341a5f90344641f')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  install -dm755 "$pkgdir/usr"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
  python setup.py install --root="$pkgdir"
}

