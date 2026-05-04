# Maintainer: cebem1nt <cebem1nt@gmail.com>

pkgname=vettel
pkgver=1.0.0
pkgrel=1
pkgdesc='A cli tool to gather different statistics and info from f1db '
arch=('any')
url='https://github.com/cebem1nt/vettel'
license=('MIT')
depends=(
    'python' 
    'python-setuptools'
)

source=(https://github.com/cebem1nt/vettel/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('ecaf2a3674f6c3f6fbaed2a86d802f6e03170c85742dbdc8d3408881abd3cdf0')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}