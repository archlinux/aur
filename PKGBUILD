# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname="desiutil"
pkgname=python-desiutil
pkgver=3.4.2
pkgrel=1
pkgdesc="General purpose tools for DESI pipeline"
arch=(any)
url="https://github.com/desihub/desiutil"
license=('custom')
depends=('python-setuptools' 'python-requests' 'python-pyyaml' 'python-astropy'
         'python-healpy' 'python-matplotlib')

source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c06792b17d1634ea0e3dad144d6bbab6146e7ba03343dfa4fc8d85882391e514')

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

