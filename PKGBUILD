# Maintainer: malet

pkgname=python-language-server-black
_pkgname=pyls-black
pkgver=0.4.6
pkgrel=1
pkgdesc="Black plugin for the Python Language Server."
arch=("any")
url="https://github.com/rupert/pyls-black"
license=("MIT")
makedepends=("python" "python-setuptools" "python-language-server" "python-black")
makedepends=("python" "python-language-server" "python-black")
source=("$pkgname-$pkgver.tar.gz::https://github.com/rupert/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("c591f57b28852e095dafb87cdd3d16fc3dfe188ec199b728f34569d472d63150")

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
