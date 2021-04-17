# Maintainer: Nissar Chababy <contact at funilrys dot com>

pkgname=python-box
pkgver=5.3.0
pkgrel=0
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
sha256sums=('4ed4ef5d34de505a65c01e3f1911de8cdb29484fcae0c035141dce535c6c194a')

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
