# Maintainer: robertfoster
pkgname=python-osadl-matrix
pkgver=2023.10.28.101022
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

sha256sums=('22129bc25cfb2d7bd05331de3bc24f7fb4eb987ac57b2371f09c07892dfdd8b2')
