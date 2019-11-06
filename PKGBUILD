# Maintainer: Marc Jose <marc@marc-jose.de>

pkgname='python-pybadges'
pkgver=2.2.1
pkgrel=1
conflicts=('python-pybadges')
provides=('python-pybadges')
pkgdesc="A Python library for creating Github-style badges"
arch=('any')
url="https://github.com/google/pybadges"
license=('Apache')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-requests' 'python-jinja')
optdepends=('python-pillow' 'python-fonttools' 'python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/pybadges/archive/${pkgver}.tar.gz")
sha512sums=('0ae0379f98b1f385b97708e4edfb5df43164e5191c7909441213594e359512bd65cb722031879ae8fabaf91079e5a843e46f4b3a7799679b0acd5e8c7ca8517b')

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