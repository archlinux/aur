# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=python-price-parser
_name=${pkgname#python-}

pkgver=0.3.4
pkgrel=1
pkgdesc="Extract price amount and currency symbol from a raw text string"

arch=('any')
url="https://github.com/scrapinghub/price-parser"
license=('BSD-3-Clause')

depends=('python')
makedepends=('python-setuptools')

source=(
  "https://github.com/scrapinghub/price-parser/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('4b1ca4ba20cf1dc661aee9376a5525fe3727b37a59ef5ee0f56c089e5ff52c73')

build() {
  cd "$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
