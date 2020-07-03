# Maintainer: Nissar Chababy <contact at funilrys dot com>

pkgname=python-wordpress-xmlrpc
pkgver=2.3
pkgrel=1
pkgdesc="WordPress XML-RPC API Integration Library"
arch=('any')
url="https://github.com/maxcutler/python-wordpress-xmlrpc/"
license=('BSD')
provides=("${pkgname}")
source=(
    "https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.zip"
)
sha256sums=(
    "e15a8e9aca16db169369e5967299c29965570ed83c7c3ad418ed59b5ad1471bd"
)

build() {
    echo "https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.zip"
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
