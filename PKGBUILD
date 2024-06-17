# Maintainer: Andy Botting <andy@andybotting.com>
_name=bigsuds
pkgname="python-$_name"
pkgver=1.0.6
pkgrel=2
pkgdesc='Library for F5 Networks iControl API'
arch=(any)
url=https://github.com/F5Networks/bigsuds
license=(MIT)
makedepends=(python-setuptools)
depends=(python-suds)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::https://github.com/F5Networks/$_name/archive/v$pkgver.tar.gz")
sha512sums=('01042ee94104eb708ded4427fd8fe2c2ae646bf449b39ebc14932641bc899be017b542af1710408ca201d31e348ad18ac8a6bf608a2e8a9717eee382265bfcf0')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
