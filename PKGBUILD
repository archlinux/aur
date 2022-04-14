# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname="desisim"
pkgname=python-desisim
pkgver=0.28.0
pkgrel=1
pkgdesc="Scripts and packages for simulating DESI spectra"
arch=(any)
url="https://github.com/desihub/desim"
license=('BSD')
depends=('python-setuptools' 'python-requests' 'python-astropy' 'python-healpy'
         'python-pytz' 'python-speclite' 'python-fitsio' 'python-numba'
         'python-desiutil' 'python-desimodel' 'python-specter')

source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4b635584d96c0892de93c4dad67d5d053d3cb1f03f73c99bbf47932cae76ec67')

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

