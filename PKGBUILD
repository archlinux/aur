# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname="desispec"
pkgname=python-desispec
pkgver=0.58.2
pkgrel=1
pkgdesc="Scripts and packages for building and running DESI spectroscopic analyses"
arch=(any)
url="https://github.com/desihub/desispec"
license=('custom')
depends=('python-requests' 'python-astropy' 'python-numba' 'python-healpy'
         'python-speclite' 'python-sqlalchemy' 'python-fitsio'
         'python-desiutil' 'python-desimodel')

source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a7dccdb6ab3e321e9c58873dbaa6daa20183804030b0d348f66f8dc1ecf52652')

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

