# Maintainer: Robin Ekman < robin.seth.ekman [at] gmail [dot] com >

pkgname=python-ass
pkgver=0.5.2
pkgrel=1
pkgdesc="A library for parsing and manipulating Advanced SubStation Alpha subtitle files."
url='http://github.com/chireiden/python-ass'
arch=('any')
license=('MIT')
depends=('python>=3.8')
makedepends=('python-setuptools')
source=('https://github.com/chireiden/python-ass/archive/refs/tags/0.5.2.tar.gz')
sha256sums=('09a3f54603b71316cc2bf549683b4461aab243460a1ff523f12dfa9b17648080')

provides=("${pkgname}")

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

check () {
    cd "${pkgname}-${pkgver}"
    pytest
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
