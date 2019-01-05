# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-unstdlib
pkgver=1.7
pkgrel=3
pkgdesc="Unstandard Python library of useful and highly-reusable functions."
arch=("any")
url="https://github.com/shazow/unstdlib.py"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/4c/d6/5aa62dd4cff8d452e69b6a7c506cb288d8ae2c99ac3d8354004b887b047b/unstdlib-1.7.tar.gz")
sha256sums=("9348ff23b8f3a235db55b11e397d55352b2029e4fb0979558fee2d1ea8667280")

build() {
    cd "unstdlib-${pkgver}"
    tail -n 21 README > LICENSE
}

package() {
    cd "unstdlib-${pkgver}"
    python setup.py install --root="${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-unstdlib/LICENSE"
}
