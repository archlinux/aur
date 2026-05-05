# Maintainer: cebem1nt <cebem1nt@gmail.com>

pkgname=vettel
pkgver=1.1.0
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
sha256sums=('3b5d57820941b2c20f8ebd3cfb20832dfd75822c9150428656fe63d89158b93e')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}