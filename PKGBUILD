# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname="speclite"
pkgname=python-speclite
pkgver=0.20
pkgrel=1
pkgdesc="A set of lightweight utilities for working with spectroscopic data in astronomy"
arch=(any)
url="https://github.com/desihub/speclite"
license=('custom')
depends=('python-numpy' 'python-scipy' 'python-astropy' 'python-yaml' 'python-setuptools'
         'python-astropy-helpers')

source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7086aff29a53f5ca6acb24cb7de43b6b016ff0c69412b8aadf52e6d4e9e32ac2')

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

