# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

pkgname="python-jwcrypto"
pkgver=0.8.0
pkgrel=1
pkgdesc="Python implementation of JWK, JWS, JWE specifications"
arch=("any")
url="https://github.com/latchset/jwcrypto"
license=("LGPL3")
depends=("python-cryptography" "python-six" "python-deprecated")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://github.com/latchset/jwcrypto/releases/download/v0.8.0/jwcrypto-0.8.tar.gz")
sha256sums=('SKIP')

build() {
    cd "jwcrypto-0.8"
    python setup.py build
}

package() {
    cd "jwcrypto-0.8"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1

    rm -Rf "${pkgdir}/usr/share/doc"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
