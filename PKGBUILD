# Maintainer: Nissar Chababy <contact at funilrys dot com>

pkgname=python-box
pkgver=5.4.1
pkgrel=1
pkgdesc="Advanced Python dictionaries with dot notation access"
arch=('any')
url="https://github.com/cdgriffith/Box"
license=('MIT')
provides=("${pkgname}")
depends=(
    'python-toml'
    'python-ruamel-yaml'
    'python-msgpack'
)
source=(
    "https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('b68e0f8abc86f3deda751b3390f64df64a0989459de51ba4db949662a7b4d8ac')

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
