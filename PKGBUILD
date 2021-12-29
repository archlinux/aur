# Maintainer: Jose Carlos Temprado <thempra@overxet.com>

pkgname=python-pycoingecko
pkgver=2.1.0
pkgrel=1
pkgdesc='Python3 wrapper around the CoinGecko API (V3)'
arch=('x86_64')
url="https://github.com/man-c/pycoingecko"
license=('MIT')
source=("https://github.com/man-c/pycoingecko/archive/refs/tags/$pkgver.zip")
sha256sums=('b37f7da73e6ef3116491513b78759e8c0aa419cdff85e7d18d4806f0f17d8cbb')

build() {
  cd pycoingecko-${pkgver}
  python setup.py build
}

package() {
  cd pycoingecko-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests 

}
