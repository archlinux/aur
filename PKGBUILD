# Maintainer: malet

pkgname=python-language-server-black
_pkgname=pyls-black
pkgver=0.3.0
pkgrel=1
pkgdesc="Black plugin for the Python Language Server."
arch=("any")
url="https://github.com/rupert/pyls-black"
license=("MIT")
makedepends=("python" "python-setuptools" "python-language-server" "python-black")
makedepends=("python" "python-language-server" "python-black")
source=("$pkgname-$pkgver.tar.gz::https://github.com/rupert/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("5c5a9221f1176ac75e8bf9ec3676114096e33f8a8dd587f4cf58679ebf2ce550")

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
