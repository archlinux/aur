# Maintainer: Nissar Chababy <contact at funilrys dot com>

pkgname=python-box
pkgver=3.4.5
pkgrel=1
pkgdesc="Advanced Python dictionaries with dot notation access"
arch=('any')
url="https://github.com/cdgriffith/Boxs"
license=('MIT')
provides=("${pkgname}")
depends=()
source=(
    "https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
    "ff2ccbbc06b9b8cfb4d00e3113079bfcd4a050365ad9aa774cb3003da705ad06"
)

build() {
    echo "https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
