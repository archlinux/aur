# Maintainer: cebem1nt <cebem1nt@gmail.com>

pkgname=vettel
pkgver=1.3.0
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
sha256sums=('c8550bfe20b236fb1438c2889eed3d6ae495c4e54a413054b266977769ea46fd')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 -m pip install . --root="$pkgdir" --no-deps --ignore-installed --no-warn-script-location
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
