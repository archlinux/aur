# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=python-refurbished
_name=${pkgname#python-}

pkgver=0.12.0
pkgrel=2
pkgdesc="Python packace to access the products information available on the Apple Certified Refurbished section of the Apple Store."

arch=('any')
url="https://github.com/zmoog/refurbished"
license=('MIT')

depends=('python' 'python-price-parser')
makedepends=('python-setuptools')

source=(
  "https://github.com/zmoog/refurbished/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('8726ad15218393a818334377270f55a680d0feeeb2d5e7dc474747ad0d9c4759')

build() {
  cd "$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
