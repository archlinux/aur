# Maintainer: Nissar Chababy <contact at funilrys dot com>

pkgname=python-box
pkgver=4.2.3
pkgrel=2
pkgdesc="Advanced Python dictionaries with dot notation access"
arch=('any')
url="https://github.com/cdgriffith/Box"
license=('MIT')
provides=("${pkgname}")
depends=(
    'python-toml'
    'python-ruamel-yaml'
)
source=(
    "https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
    "37dcaee62446cef67ffad7baef0f1b5f541587e2064f1152ec3bc0ead64092a2"
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
