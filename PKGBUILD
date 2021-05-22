# Maintainer: Joshua Munn <public@elysee-munn.family>
pkgname=python-lsp-black
pkgver=1.0.0
pkgrel=1
pkgdesc="Black plugin for python-lsp-server"
arch=("any")
url="https://github.com/python-lsp/python-lsp-black"
license=("MIT")
makedepends=("python-setuptools")
depends=("python" "python-lsp-server" "python-black")
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-lsp/python-lsp-black/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('8c631b0d41061fae31533ee193f445d0')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
