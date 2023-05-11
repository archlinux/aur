# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname="speclite"
pkgname=python-speclite
pkgver=0.16
pkgrel=1
pkgdesc="A set of lightweight utilities for working with spectroscopic data in astronomy"
arch=(any)
url="https://github.com/desihub/speclite"
license=('custom')
depends=('python-numpy' 'python-scipy' 'python-astropy' 'python-yaml' 'python-setuptools'
         'python-astropy-helpers')

source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fd63e04bb6ddb3e6e54c78252b42f048381296d447b55968708c46b17aac4bce')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  install -dm755 "$pkgdir/usr"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "licenses/LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
  python setup.py install --root="$pkgdir"
}

