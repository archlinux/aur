# Maintainer: Marc Jose <marc@marc-jose.de>

pkgname='python-pybadges'
pkgver=2.2.0
pkgrel=1
conflicts=('python-pybadges')
provides=('python-pybadges')
pkgdesc="A Python library for creating Github-style badges"
arch=('any')
url="https://github.com/google/pybadges"
license=('Apache')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/pybadges/archive/${pkgver}.tar.gz")
sha512sums=('49c3c0205450430ae23e8f6bb45c8ac805be15ec114f8c68be95ad3739d4219453d10d75977c7db82cbd423c8db90f811d48e35dca63e5c16a92e60b7af0a585')

build() {
    cd "${srcdir}/pybadges-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/pybadges-${pkgver}"
    
    python setup.py install --skip-build -O1 --root="${pkgdir}"
    
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}