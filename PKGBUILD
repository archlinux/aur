# Maintainer: robertfoster
pkgname=python-osadl-matrix
pkgver=2024.02.13.010236
pkgrel=1
pkgdesc="OSADL license compatibility matrix as a CSV"
arch=('any')
depends=('python')
makedepends=(python-{build,installer,wheel} python-setuptools)
url="https://github.com/priv-kweihmann/osadl-matrix"
license=('Unlicense' 'CCPL:by-4.0')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

build() {
  cd "${pkgname##python-}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname##python-}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('a91433f342cf652dd04832b1c1752da2cdacc5de8bbc3ca71a9ae2099f0460d9')
