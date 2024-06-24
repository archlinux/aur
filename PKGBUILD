# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=python-refurbished
_name=${pkgname#python-}

pkgver=0.11.0
pkgrel=1
pkgdesc="Python packace to access the products information available on the Apple Certified Refurbished section of the Apple Store."

arch=('any')
url="https://github.com/zmoog/refurbished"
license=('MIT')

depends=('python' 'python-price-parser')
makedepends=('python-setuptools')

source=(
  "https://github.com/zmoog/refurbished/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('ce563b66fe7b70bb8478fdf962ad3cf027986e6f1e37948dbaa16c46072d6b94')

build() {
  cd "$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
