# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=python-price-parser
_name=${pkgname#python-}

pkgver=0.4.0
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
sha256sums=('5961712ebe6d7f3ff1803abfe07df95ba299ce6819b701818244c62e318a5081')

build() {
  cd "$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
