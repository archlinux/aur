# Maintainer: cebem1nt <cebem1nt@gmail.com>

pkgname=vettel
pkgver=1.1.1
pkgrel=1
pkgdesc='Get different formula 1 statistics and info'
arch=('any')
url='https://github.com/cebem1nt/vettel'
license=('MIT')
depends=(
    'python>=3.10' 
)

makedepends=('python-setuptools')

source=(https://github.com/cebem1nt/vettel/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('c57209c1edf006d3a04ab3297b7c0f0502e4d89f31be219e7caf499cca448b0d')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 -m pip install . --root="$pkgdir" --no-deps --ignore-installed --no-warn-script-location
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}