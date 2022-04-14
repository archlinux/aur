# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname="desiutil"
pkgname=python-desiutil
pkgver=3.2.5
pkgrel=1
pkgdesc="General purpose tools for DESI pipeline"
arch=(any)
url="https://github.com/desihub/desiutil"
license=('custom')
depends=('python-setuptools' 'python-requests' 'python-pyyaml' 'python-astropy'
         'python-healpy' 'python-matplotlib')

source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bb3c9814e5b470c2927b8b8d56787ebdf49648b7777b7ffc9954f2df5fc02dc9')

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

