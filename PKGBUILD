# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname='desitarget'
pkgname=python-desitarget
pkgver=0.22.0
pkgrel=2
pkgdesc="Scripts and packages for selecting DESI targets from photometric catalogs"
arch=(any)
url="https://github.com/desihub/desitarget"
license=('custom')
depends=('python-setuptools' 'python-requests' 'python-pytz' 'python-astropy'
         'python-healpy' 'python-numba' 'python-speclite' 'python-sqlalchemy'
         'python-fitsio' 'python-photutils' 'python-specter' 'python-desimodel')

source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d6e6cad828d9762384352e7c9aa3c9bd7ce94023dc0789d92726565b1f8ba19d')

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

